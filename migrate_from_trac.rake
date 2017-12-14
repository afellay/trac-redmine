# Redmine - project management software
# Copyright (C) 2006-2011  Jean-Philippe Lang
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

require 'active_record'
require 'iconv'
require 'pp'


namespace :redmine do
	desc 'Trac migration script'
	task :migrate_from_trac => :environment do

	module TracMigrate
		TICKET_MAP = []

		DEFAULT_STATUS = IssueStatus.default
		STATUS_MAPPING = {}
    
     new_status = IssueStatus.find_by_position(1)
     EnAnalisis = IssueStatus.find_by_position(2)
     EnDesarrollo = IssueStatus.find_by_position(3)
     EnTesteo = IssueStatus.find_by_position(4)
     EnDocumentacion = IssueStatus.find_by_position(5)
     ListoParaDesarrollo = IssueStatus.find_by_position(6)
     ListoParaTesteo = IssueStatus.find_by_position(7)
     ListoParaDocumentacion = IssueStatus.find_by_position(8)
     closed_status = IssueStatus.where(:is_closed => true).first
   /   STATUS_MAPPING = {'new' => new_status,
                        'EnAnalisis' => EnAnalisis,
                        'EnDesarrollo' => EnDesarrollo,
                        'EnTesteo' => EnTesteo,
                        'EnDocumentacion' => EnDocumentacion,
                        'ListoParaDesarrollo' => ListoParaDesarrollo,
                        'ListoParaTesteo' => ListoParaTesteo,
                        'ListoParaDocumentacion' => ListoParaDocumentacion,
                        'closed' => closed_status
                        }
  /


		priorities = IssuePriority.all
		DEFAULT_PRIORITY = priorities[0]
    PRIORITY_MAPPING = {}
    /PRIORITY_MAPPING = {'Baja' => priorities[0],
                        'Media' => priorities[1],
                        'Alta' => priorities[2]
                    }
/
		TRACKER_BUG = Tracker.find_by_position(1)
		TRACKER_FEATURE = Tracker.find_by_position(2)
		trackers = Tracker.all
		DEFAULT_TRACKER = trackers[0]
		TRACKER_MAPPING = {}

		roles = Role.find(:all, :conditions => {:builtin => 0}, :order => 'position ASC')
		manager_role = roles[0]
		developer_role = roles[1]
		DEFAULT_ROLE = roles[1]
		ROLE_MAPPING = {'admin' => manager_role,
						'developer' => developer_role
						}

		class ::Time
			class << self
				alias :real_now :now
				def now
					real_now - @fake_diff.to_i
				end
				def fake(time)
          time = 0 if time.nil?
					@fake_diff = real_now - time
					res = yield
					@fake_diff = 0
					res
				end
			end
		end

		class TracComponent < ActiveRecord::Base
			set_table_name :component
		end

    class TracMilestone < ActiveRecord::Base
			set_table_name :milestone
			# If this attribute is set a milestone has a defined target timepoint
			def due
				if read_attribute(:due) && read_attribute(:due) > 0
				Time.at(read_attribute(:due)).to_date
				else
				nil
				end
			end
			# This is the real timepoint at which the milestone has finished.
			def completed
				if read_attribute(:completed) && read_attribute(:completed) > 0
				Time.at(read_attribute(:completed)).to_date
				else
				nil
				end
			end

			def description
				# Attribute is named descr in Trac v0.8.x
				has_attribute?(:descr) ? read_attribute(:descr) : read_attribute(:description)
			end
		end
    
		class TracEnum < ActiveRecord::Base
			set_table_name :enum
			set_inheritance_column :none
		end
  
    /  # VAmos a ver si las versiones detectadas se pueden agregar a la tabla VErsion
    class TracVersion < ActiveRecord::Base
			set_table_name :version
			# If this attribute is set a milestone has a defined target timepoint
			def due
				if read_attribute(:due) && read_attribute(:due) > 0
				Time.at(read_attribute(:due)).to_date
				else
				nil
				end
			end
			# This is the real timepoint at which the milestone has finished.
			def completed
				if read_attribute(:completed) && read_attribute(:completed) > 0
				Time.at(read_attribute(:completed)).to_date
				else
				nil
				end
			end
      def description
				# Attribute is named descr in Trac v0.8.x
				has_attribute?(:descr) ? read_attribute(:descr) : read_attribute(:description)
			end
		end
/
		

		class TracTicketCustom < ActiveRecord::Base
			set_table_name :ticket_custom
		end

		class TracAttachment < ActiveRecord::Base
			set_table_name :attachment
			set_inheritance_column :none

		def time; Time.at(read_attribute(:time)) end

		def original_filename
			filename
		end
    
		def content_type
			 '' 
		end

		def exist?
			File.file? trac_fullpath
		end

		def open
			File.open("#{trac_fullpath}", 'rb') {|f|
			@file = f
			yield self
			}
		end

		def read(*args)
			@file.read(*args)
		end

		def description
			read_attribute(:description).to_s.slice(0,255)
		end

		private
			def trac_fullpath
				attachment_type = read_attribute(:type)
				#BY LUC
        #  = filename.gsub( /[^a-zA-Z0-9\-_\.!~*']/n ) {|x| sprintf('%%%02x', x[0]) }
        trac_file = filename.gsub( /[^a-zA-Z0-9\-_\.!~*']/n ) do |x|
            codepoint = x.codepoints.to_a[0]
            case codepoint 
            when 243 #ó
              "%C3%B3"
            when 242 #ò
              "%C3%B2"
            when 210 #Ò
              "%C3%92"
            when 186 #°
              "%C2%B0"
            when 38 #&  
              "%26"
            when 40 #(
              "%28"
            when 41 #)
              "%29"
            when 91 #[
              "%5B"
            when 93 #]
              "%5D"
            when 36 #$
              "%24"
            when 35 ##
              "%23"
            when 44 ##
              "%2C"
            when 45 #-
              "%2D"
            when 211 #Ó
              "%C3%93"
            when 225 #á
              "%C3%A1"
            when 193 #Á
              "%C3%81"
            when 233 #é 
              "%C3%A9"            
            when 237 #í
              "%C3%AD"
            when 250 #ú
              "%C3%BA"
            when 237 #í
              "%C3%AD"
            when 241 #ñ
              "%C3%B1"
            when 8211 #
              "%E2%80%93"
            when 32             
            sprintf('%%%02x', codepoint)
            else
            print "XX [#{x}] "
            print "codepoint [#{codepoint}] "
              
            end
          end  

				"#{TracMigrate.trac_attachments_directory}/#{attachment_type}/#{id}/#{trac_file}"
			end
		end

		class TracTicket < ActiveRecord::Base
			set_table_name :ticket
			set_inheritance_column :none

			# ticket changes: only migrate status changes and comments
			has_many :changes, :class_name => "TracTicketChange", :foreign_key => :ticket
			has_many :customs, :class_name => "TracTicketCustom", :foreign_key => :ticket

			def attachments
				TracMigrate::TracAttachment.all(:conditions => ["type = 'ticket' AND id = ?", self.id.to_s])
			end

			def ticket_type
				read_attribute(:type)
			end

			def summary
				read_attribute(:summary).blank? ? "(no subject)" : read_attribute(:summary)
			end

			def description
				read_attribute(:description).blank? ? summary : read_attribute(:description)
			end

			def time; Time.at(read_attribute(:time)) end
      
			def changetime; Time.at(read_attribute(:changetime)) end
		end

		class TracTicketChange < ActiveRecord::Base
			set_table_name :ticket_change
			def time; Time.at(read_attribute(:time)) end
		end

		TRAC_WIKI_PAGES = %w(InterMapTxt InterTrac InterWiki RecentChanges SandBox TracAccessibility TracAdmin TracBackup TracBrowser TracCgi TracChangeset \
							TracEnvironment TracFastCgi TracGuide TracImport TracIni TracInstall TracInterfaceCustomization \
							TracLinks TracLogging TracModPython TracNotification TracPermissions TracPlugins TracQuery \
							TracReports TracRevisionLog TracRoadmap TracRss TracSearch TracStandalone TracSupport TracSyntaxColoring TracTickets \
							TracTicketsCustomFields TracTimeline TracUnicode TracUpgrade TracWiki WikiDeletePage WikiFormatting \
							WikiHtml WikiMacros WikiNewPage WikiPageNames WikiProcessors WikiRestructuredText WikiRestructuredTextLinks \
							CamelCase TitleIndex)

		class TracWikiPage < ActiveRecord::Base
			set_table_name :wiki
			set_primary_key :name

			def self.columns
				# Hides readonly Trac field to prevent clash with AR readonly? method (Rails 2.0)
				super.select {|column| column.name.to_s != 'readonly'}
			end

			def attachments
				TracMigrate::TracAttachment.all(:conditions => ["type = 'wiki' AND id = ?", self.id.to_s])
			end

			def time; Time.at(read_attribute(:time)) end
		end

		class TracPermission < ActiveRecord::Base
			set_table_name :permission
		end

		class TracSessionAttribute < ActiveRecord::Base
			set_table_name :session_attribute
		end

		def self.find_or_create_user(username, project_member = false)
		#	print " >> (NO USER)" if username.blank? # debug
			return User.anonymous if username.blank?
		#	print " >> (#{username})" # debug

			u = User.find_by_login(username)
			if !u
				# Create a new user if not found
				mail = username[0, User::MAIL_LENGTH_LIMIT]
				if mail_attr = TracSessionAttribute.find_by_sid_and_name(username, 'email')
					mail = mail_attr.value
				end
				mail = "#{mail}@foo.bar" unless mail.include?("@")
				#print " [#{mail}]" # debug
				
        
				name = username
				if name_attr = TracSessionAttribute.find_by_sid_and_name(username, 'name')
					name = name_attr.value
		#			print " <#{name}: FOUND BY SID>" # debug
				else # debug
					print " <SID NOT FOUND>" # debug
				end
        name =~ (/(\w+)(\s+\w+)?/)
       
        fn = ($1 || "-").strip
				ln = ($3 || '-').strip

				u = User.new(:mail => mail.gsub(/[^-@a-z0-9\.]/i, '-'), :firstname => fn[0, limit_for(User, 'firstname')], :lastname => ln[0, limit_for(User, 'lastname')])
				u.login = username[0, User::LOGIN_LENGTH_LIMIT].gsub(/[^a-z0-9_\-@\.]/i, '-')
				u.password = 'tractrac'
				u.admin = true if TracPermission.find_by_username_and_action(username, 'admin')
				#print " [em:#{u.mail} ln:#{u.lastname} fn:#{u.firstname} log:#{u.login} ad:#{u.admin} v:#{u.valid?}]" # debug
				# finally, a default user is used if the new user is not valid
				salvado = u.save
				puts " [[#{u.errors.full_messages}]]" if u.errors.full_messages != ""
				u = User.find(:first) unless salvado
			#else # debug
			#	print " <USUARIO EXISTENTE>" # debug
			end
			# Make sure he is a member of the project
			if project_member && !u.member_of?(@target_project)
				role = DEFAULT_ROLE
				if u.admin
					role = ROLE_MAPPING['admin']
				elsif TracPermission.find_by_username_and_action(username, 'developer')
					role = ROLE_MAPPING['developer']
				end
				Member.create(:user => u, :project => @target_project, :roles => [role])
			#	print " <CREADO EN #{@target_project}>" # debug
				u.reload
			#else # debug
			#	print " <NO CREADO EN #{@target_project}>" # debug
			end
			u
		end

		# Basic wiki syntax conversion
		def self.convert_wiki_text(text)
			# Parche luc imagenes wiki http://www.redmine.org/issues/2826
			text = text.gsub(/\[\[Image\(([a-zA-Z]+\:(\d+\:)?)?([^\)^,]+)[^\)]*\)\]\]/, '!\3!')
			# Titles
			text = text.gsub(/^(\=+)\s(.+)\s(\=+)/) {|s| "\nh#{$1.length}. #{$2}\n"}
			# External Links
			text = text.gsub(/\[(http[^\s]+)\s+([^\]]+)\]/) {|s| "\"#{$2}\":#{$1}"}
			# Ticket links:
			#      [ticket:234 Text],[ticket:234 This is a test]
			text = text.gsub(/\[ticket\:([^\ ]+)\ (.+?)\]/, '"\2":/issues/show/\1')
			#      ticket:1234
			#      #1 is working cause Redmine uses the same syntax.
			text = text.gsub(/ticket\:([^\ ]+)/, '#\1')
			# Milestone links:
			#      [milestone:"0.1.0 Mercury" Milestone 0.1.0 (Mercury)]
			#      The text "Milestone 0.1.0 (Mercury)" is not converted,
			#      cause Redmine's wiki does not support this.
			text = text.gsub(/\[milestone\:\"([^\"]+)\"\ (.+?)\]/, 'version:"\1"')
			#      [milestone:"0.1.0 Mercury"]
			text = text.gsub(/\[milestone\:\"([^\"]+)\"\]/, 'version:"\1"')
			text = text.gsub(/milestone\:\"([^\"]+)\"/, 'version:"\1"')
			#      milestone:0.1.0
			text = text.gsub(/\[milestone\:([^\ ]+)\]/, 'version:\1')
			text = text.gsub(/milestone\:([^\ ]+)/, 'version:\1')
			# Internal Links
			text = text.gsub(/\[\[BR\]\]/, "\n") # This has to go before the rules below
			text = text.gsub(/\[\"(.+)\".*\]/) {|s| "[[#{$1.delete(',./?;|:')}]]"}
			text = text.gsub(/\[wiki:\"(.+)\".*\]/) {|s| "[[#{$1.delete(',./?;|:')}]]"}
			text = text.gsub(/\[wiki:\"(.+)\".*\]/) {|s| "[[#{$1.delete(',./?;|:')}]]"}
			text = text.gsub(/\[wiki:([^\s\]]+)\]/) {|s| "[[#{$1.delete(',./?;|:')}]]"}
			text = text.gsub(/\[wiki:([^\s\]]+)\s(.*)\]/) {|s| "[[#{$1.delete(',./?;|:')}|#{$2.delete(',./?;|:')}]]"}

			# Links to pages UsingJustWikiCaps
			text = text.gsub(/([^!]|^)(^| )([A-Z][a-z]+[A-Z][a-zA-Z]+)/, '\\1\\2[[\3]]')
			# Normalize things that were supposed to not be links
			# like !NotALink
			text = text.gsub(/(^| )!([A-Z][A-Za-z]+)/, '\1\2')
			# Revisions links
			text = text.gsub(/\[(\d+)\]/, 'r\1')
			# Ticket number re-writing
			text = text.gsub(/#(\d+)/) do |s|
				if $1.length < 10
				#TICKET_MAP[$1.to_i] ||= $1
					"\##{TICKET_MAP[$1.to_i] || $1}"
				else
					s
				end
			end
		
			# We would like to convert the Code highlighting too
			# This will go into the next line.
			shebang_line = false
			# Reguar expression for start of code
			pre_re = /\{\{\{/
			# Code hightlighing...
			shebang_re = /^\#\!([a-z]+)/
			# Regular expression for end of code
			pre_end_re = /\}\}\}/

			# Go through the whole text..extract it line by line
			text = text.gsub(/^(.*)$/) do |line|
				m_pre = pre_re.match(line)
				if m_pre
					line = '<pre>'
				else
					m_sl = shebang_re.match(line)
					if m_sl
						shebang_line = true
						line = '<code class="' + m_sl[1] + '">'
					end
					m_pre_end = pre_end_re.match(line)
					if m_pre_end
						line = '</pre>'
						if shebang_line
						line = '</code>' + line
					end
				end
			end
			line
		end

		# Highlighting
		text = text.gsub(/'''''([^\s])/, '_*\1')
		text = text.gsub(/([^\s])'''''/, '\1*_')
		text = text.gsub(/'''/, '*')
		text = text.gsub(/''/, '_')
		text = text.gsub(/__/, '+')
		text = text.gsub(/~~/, '-')
		text = text.gsub(/`/, '@')
		text = text.gsub(/,,/, '~')
		# Lists
		text = text.gsub(/^([ ]+)\* /) {|s| '*' * $1.length + " "}

		text
	end

	def self.migrate
		establish_connection

		# Quick database test
		TracComponent.count

		migrated_components = 0
		migrated_priorities = 0
		migrated_statuses = 0
		migrated_ticket_types = 0
    migrated_milestones = 0
		migrated_version = 0
		migrated_tickets = 0
		migrated_custom_values = 0
		migrated_ticket_attachments = 0
    nomigrated_ticket_attachments = 0
    migrated_severity = 0
		migrated_wiki_edits = 0
		migrated_wiki_attachments = 0

		#Wiki system initializing...
		@target_project.wiki.destroy if @target_project.wiki
		@target_project.reload
		wiki = Wiki.new(:project => @target_project, :start_page => 'WikiStart')
		wiki_edit_count = 0

		# Components
		print "Migrando componentes"
		issues_category_map = {}
		TracComponent.find(:all).each do |component|
			print '.'
			STDOUT.flush
				c = IssueCategory.new :project => @target_project,
					:name => encode(component.name[0, limit_for(IssueCategory, 'name')])
			next unless c.save
			issues_category_map[component.name] = c
			migrated_components += 1
		end
		puts

		# Tipos de ticket
		print "Migrando Tipos de ticket"
		#Tracker.delete_all
		TracEnum.find(:all,:conditions => {:type => 'ticket_type'}).each do |ticket_type|
			print '.'
			STDOUT.flush
      if !Tracker.where(:name => ticket_type.name).exists? # CONTROLA QUE NO EXISTA EN LA DB
				c = Tracker.new :name => encode(ticket_type.name[0, limit_for(Tracker, 'name')]),
					:is_in_chlog => 't' ,
					:is_in_roadmap => 't'
				c.projects << @target_project
        next unless c.save
        TRACKER_MAPPING[ticket_type.name] = c
      else
         TRACKER_MAPPING[ticket_type.name] = Tracker.where(:name => ticket_type.name).first
      end
      migrated_ticket_types += 1
		end
		puts

		# Ticket Types
		print "Migrando ticket types"
    #	IssuePriority.delete_all
		TracEnum.find(:all,:conditions => {:type => 'priority'}).each do |priority|
			print '.'
			STDOUT.flush
      if !IssuePriority.where(:name => priority.name).exists? # CONTROLA QUE NO EXISTA EN LA DB
				c = IssuePriority.new(
					:project => @target_project,
					:name => encode(priority.name[0, limit_for(IssuePriority, 'name')]),
					:active => 't'
					)
        next unless c.save
        PRIORITY_MAPPING[priority.name] = c
      else
        PRIORITY_MAPPING[priority.name] = IssuePriority.where(:name => priority.name).first
      end
      migrated_priorities += 1  # HAY QUE EVALUAR SI SE TIENEN QUE CONTABILIZAR CUANDO YA EXISTE
		end
		puts


		# Ticket status
		print "Migrating ticket status"
		#IssueStatus.delete_all
		TracTicketChange.find_by_sql("SELECT DISTINCT oldvalue FROM #{TracTicketChange.table_name} where (field = 'estado' or field = 'status') and oldvalue <> ''").each do |status|

			print '.'
			STDOUT.flush
      
      if !IssueStatus.where(:name => status.oldvalue).exists? # CONTROLA QUE NO EXISTA EN LA DB
        c = IssueStatus.new :name => encode(status.oldvalue[0, limit_for(IssueStatus, 'name')])
        if(status.oldvalue == 'Nuevo')
          c.is_default = 't'
        end
        if(status.oldvalue == 'Cerrado')
          c.is_closed = 't'
        end

        next unless c.save
        STATUS_MAPPING[status.oldvalue] = c
      else
        STATUS_MAPPING[status.oldvalue] = IssueStatus.where(:name => status.oldvalue).first
        #STATUS_MAPPING = {'new' => new_status}
      end
      migrated_statuses += 1 # HAY QUE EVALUAR SI SE TIENEN QUE CONTABILIZAR CUANDO YA EXISTE
    end

		TracTicketChange.find_by_sql("SELECT DISTINCT newvalue FROM #{TracTicketChange.table_name} where (field = 'estado' or field = 'status')").each do |status|
			print '.'
			STDOUT.flush
			if(STATUS_MAPPING[status.newvalue])
				next
			else
				c = IssueStatus.new :name => encode(status.newvalue[0, limit_for(IssueStatus, 'name')])
				c.save
				STATUS_MAPPING[status.newvalue] = c
				migrated_statuses += 1
			end
		end
		puts
     
		# Ticket status
		print "Migrando workflow"
		WorkflowTransition.delete_all
		TracTicketChange.find_by_sql("SELECT DISTINCT oldvalue, newvalue FROM #{TracTicketChange.table_name} where field = 'status' and oldvalue <> '' and newvalue <> ''").each do |transicion|
		print '.'
		STDOUT.flush
			Tracker.find(:all).each do |tracker|
				Role.find(:all).each do |role|
					c = WorkflowTransition.new :old_status_id => STATUS_MAPPING[transicion.oldvalue].id,
						:new_status_id => STATUS_MAPPING[transicion.newvalue].id,
						:tracker_id => tracker.id,
						:role_id => role.id
					c.save
				end
			end
		end
		puts
    
    # Milestones
		print "Migrando milestones"
		version_map = {}
		TracMilestone.find(:all).each do |milestone|
			print '.'
			STDOUT.flush
			# First we try to find the wiki page...
			p = wiki.find_or_new_page(milestone.name.to_s)
			p.content = WikiContent.new(:page => p) if p.new_record?
			p.content.text = milestone.description.to_s
			p.content.author = find_or_create_user('trac') # Este usuario se termina creando, ser�a un usuario administrador...
			p.content.comments = 'Milestone'
			p.save

			v = Version.new :project => @target_project,
				:name => encode(milestone.name[0, limit_for(Version, 'name')]),
				:description => nil,
				:wiki_page_title => milestone.name.to_s,
				:effective_date => milestone.completed

			next unless v.save

			version_map[milestone.name] = v
			migrated_milestones += 1
		end
		puts
    
		# Custom fields
		# TODO: read trac.ini instead
		print "Migrating custom fields"
		custom_field_map = {}
		TracTicketCustom.find_by_sql("SELECT DISTINCT name FROM #{TracTicketCustom.table_name}").each do |field|
			print '.'
			STDOUT.flush
			# Redmine custom field name
			field_name = encode(field.name[0, limit_for(IssueCustomField, 'name')]).humanize
			# Find if the custom already exists in Redmine
			
      print "Nombre de field_name [#{field_name}]"

      filter = true
      
      if field_name == 'Boletin'
        format = 'text'
        filter = false
   /   elsif field_name == 'nota_testeo' # Esto es de G2
        field_name = 'Notas para Testeo'
        format = 'text'
        filter = false
      elsif field_name == 'nota_int' # Esto es de G2
        field_name = 'Notas Internas'
        format = 'text'
        filter = false  
      elsif field_name == 'Nota obj' # Esto es de G2
        field_name = 'Obj a catalogar'
        format = 'text'
        filter = false
  /
      elsif field_name == 'Operacion' # Esto es de G2
        format = 'list'
        filter = false
      else  
        format = 'string'
      end
			f = IssueCustomField.find_by_name(field_name)
      #print "Nombre de field_name [#{field_name}]"
     
			# Or create a new one
			f ||= IssueCustomField.create(
					:name => encode(field.name[0, limit_for(IssueCustomField, 'name')]).humanize, 
					:field_format => format,
          :is_filter => filter
					)

			next if f.new_record?
			f.trackers = Tracker.find(:all)
			f.projects << @target_project
			custom_field_map[field.name] = f
		end
	### SI EL CAMPO ES DE TIPO LISTA HAY QUE AGREGARLO ABAJO, PARA DEFINIRLE POSIBLES VALORES, CASO CONTRARIO SOLAMENTE ARRIBA	
  #
    no = IssueCustomField.find(:first, :conditions => { :name => 'Obj a catalogar' })
		no = IssueCustomField.new(:name => 'Obj a catalogar', :field_format => 'text', :is_filter => false) if no.nil? 
		no.trackers = Tracker.find(:all)
		no.projects << @target_project
		no.save!
		custom_field_map['nota_obj'] = no
		
    nt = IssueCustomField.find(:first, :conditions => { :name => "Notas para Testeo" })
		nt = IssueCustomField.new(:name => 'Notas para Testeo', :field_format => 'text', :is_filter => true) if nt.nil? 
		nt.trackers = Tracker.find(:all)
		nt.projects << @target_project
		nt.save!
		custom_field_map['nota_testeo'] = nt

    ni = IssueCustomField.find(:first, :conditions => { :name => "Notas Internas" })
		ni = IssueCustomField.new(:name => 'Notas Internas', :field_format => 'text', :is_filter => true) if ni.nil? 
		ni.trackers = Tracker.find(:all)
		ni.projects << @target_project
		ni.save!
		custom_field_map['nota_int'] = ni
    
		# Trac 'resolution' field as a Redmine custom field
		p = IssueCustomField.find(:first, :conditions => { :name => "Perfil" })
		p = IssueCustomField.new(:name => 'Perfil', :field_format => 'list', :is_filter => true) if p.nil?
		p.trackers = Tracker.find(:all)
		p.projects << @target_project
		p.possible_values = (p.possible_values + %w(Gestion)).flatten.compact.uniq
		p.save!
		custom_field_map['perfiles_sol'] = p
    
    # Severity
		s = IssueCustomField.find(:first, :conditions => { :name => "Gravedad" })
		s = IssueCustomField.new(:name => 'Gravedad', :field_format => 'list', :is_filter => true) if s.nil?
		s.trackers = Tracker.find(:all)
		s.projects << @target_project
		s.possible_values = (s.possible_values + %w(Deseable Necesario Urgente Impresindible)).flatten.compact.uniq
		s.save!
		custom_field_map['severity'] = s
    
    
		# Trac 'resolution' field as a Redmine custom field
		r = IssueCustomField.find(:first, :conditions => { :name => "Resolution" })
		r = IssueCustomField.new(:name => 'Resolution', :field_format => 'list', :is_filter => true) if r.nil?
		r.trackers = Tracker.find(:all)
		r.projects << @target_project
		r.possible_values = (r.possible_values + %w(Duplicado)).flatten.compact.uniq
		r.save!
		custom_field_map['resolution'] = r
 
    
    # Universidad Solicitante
		u = IssueCustomField.find(:first, :conditions => { :name => "Institucion Solicitante" })
		u = IssueCustomField.new(:name => 'Institucion Solicitante', :field_format => 'list', :is_filter => true) if u.nil?
		u.trackers = Tracker.find(:all)
		u.projects << @target_project
    u.possible_values = (u.possible_values + %w(SIU)).flatten.compact.uniq #ESTO SE PODRA AGREGAR ARRIBA?
		u.save!
    custom_field_map['univ_solicitante'] = u
    
   	# VER SI SE PUEDE PONER LAS URL DEL GDS ACA
		g = IssueCustomField.find(:first, :conditions => { :name => "GDS" })
		g = IssueCustomField.new(:name => 'GDS', :field_format => 'link', :is_filter => true) if g.nil? 
		g.trackers = Tracker.find(:all)
		g.projects << @target_project
		g.save!
		custom_field_map['gds_solicitudes'] = g
    
    d = IssueCustomField.find(:first, :conditions => { :name => "Revision desarrollo" })
		d = IssueCustomField.new(:name => 'Revision desarrollo', :field_format => 'link', :is_filter => false) if d.nil? 
		d.trackers = Tracker.find(:all)
		d.projects << @target_project
		d.save!
		custom_field_map['revision_desa'] = d
    
    t = IssueCustomField.find(:first, :conditions => { :name => "Revision Test" })
		t = IssueCustomField.new(:name => 'Revision Test', :field_format => 'link', :is_filter => false) if t.nil? 
		t.trackers = Tracker.find(:all)
		t.projects << @target_project
		t.save!
		custom_field_map['revision_test'] = t    
    
    ri = IssueCustomField.find(:first, :conditions => { :name => "Rev Interna" })
		ri = IssueCustomField.new(:name => 'Rev Interna', :field_format => 'link', :is_filter => true) if ri.nil? 
		ri.trackers = Tracker.find(:all)
		ri.projects << @target_project
		ri.save!
		custom_field_map['revision_inte'] = ri   
       	
		m = IssueCustomField.find(:first, :conditions => { :name => "Ticket Migrado" })
		m = IssueCustomField.new(:name => 'Ticket Migrado', :field_format => 'link', :is_filter => true) if m.nil? 
		m.trackers = Tracker.find(:all)
		m.projects << @target_project
		m.save!
		custom_field_map['Ticket Migrado'] = m
    
    vr = IssueCustomField.find(:first, :conditions => { :name => "Version de Referencia" })
    vr = IssueCustomField.new(:name => 'Version de Referencia',:field_format => 'version',:is_filter => true) if vr.nil?
    vr.trackers = Tracker.find(:all)
    vr.projects << @target_project
    vr.save!
    custom_field_map['found_in_version'] = vr
    

		# Tickets
    print "Migrando tickets: "
		#TracTicket.find_each(:batch_size => 200) do |ticket|
    TracTicket.find(:all).each do |ticket|
			print '.'
			STDOUT.flush
			i = Issue.new :project => @target_project,
				:subject => encode(ticket.summary[0, limit_for(Issue, 'subject')]),
				:description => convert_wiki_text(encode(ticket.description)),
				:priority => PRIORITY_MAPPING[ticket.priority] || DEFAULT_PRIORITY,
				:created_on => ticket.time

			i.author = find_or_create_user(ticket.reporter)
			i.category = issues_category_map[ticket.component] unless ticket.component.blank?
			i.fixed_version = version_map[ticket.milestone] unless ticket.milestone.blank?
			i.status = STATUS_MAPPING[ticket.status] || DEFAULT_STATUS
			i.tracker = TRACKER_MAPPING[ticket.ticket_type] || DEFAULT_TRACKER
			i.id = ticket.id unless Issue.exists?(ticket.id)
   #   print "ID #{ticket.id} "
   #   print "component #{ticket.component} "
   #   print "milestone #{ticket.milestone} "
   #  print "status #{ticket.status} "
   #  print "ticket_type #{ticket.ticket_type} "
   #  print ticket.reporter
   #   puts
      
			next unless Time.fake(ticket.changetime) { i.save }
			TICKET_MAP[ticket.id] = i.id
			migrated_tickets += 1

			# Owner
			unless ticket.owner.blank?
				i.assigned_to = find_or_create_user(ticket.owner, true)
				Time.fake(ticket.changetime) { i.save }
			end

			# Comments and status/resolution changes
    	ticket.changes.group_by(&:time).each do |time, changeset|
        #Agrego esto del script Nuevo
        comment_change = changeset.select {|change| change.field == 'comment'}.first
        # Severity
        severity_change = changeset.select { |change| change.field == 'severity' }.first

        n = Journal.new :notes => (comment_change ? convert_wiki_text(encode(comment_change.newvalue)) : ''),
                        :created_on => time
        n.user = find_or_create_user(changeset.first.author)
        n.journalized = i
        
        # Severity
        if severity_change
          n.details << JournalDetail.new(:property => 'cf',
                                         :prop_key => custom_field_map['severity'].id,
                                         :old_value => severity_change.oldvalue,
                                         :value => severity_change.newvalue)
        end

        changeset.each do |change|
          if(change.field == 'comment')
            n.notes = convert_wiki_text(encode(change.newvalue))
          end
          if (
            change.field == 'status' &&
            STATUS_MAPPING[change.oldvalue] &&
            STATUS_MAPPING[change.newvalue] &&
            (STATUS_MAPPING[change.oldvalue] != STATUS_MAPPING[change.newvalue])
            )
            n.details << JournalDetail.new(
              :property => 'attr',
              :prop_key => 'status_id',
              :old_value => STATUS_MAPPING[change.oldvalue].id,
              :value => STATUS_MAPPING[change.newvalue].id
              )
          end
          if change.field == 'resolution' &&
            n.details << JournalDetail.new(
              :property => 'cf',
              :prop_key => custom_field_map['resolution'].id,
              :old_value => change.oldvalue,
              :value => change.newvalue
              )
          end
          if change.field == 'Ticket Migrado' &&
            n.details << JournalDetail.new(
              :property => 'cf',
              :prop_key => custom_field_map['Ticket Migrado'].id,
              :old_value => change.oldvalue,
              :value => change.newvalue
              )
          end

          if(change.field != 'status' &&change.field != 'resolution' && change.field != 'comment' && change.field != 'Ticket Migrado' && change.field != 'GDS')
            if(custom_field_map.include? change.field)
              n.details << JournalDetail.new(:property => 'cf',
                    :prop_key => custom_field_map[change.field].id,
                    :old_value => change.oldvalue,
                    :value => change.newvalue)
            else
              if(change.field == 'owner')

                n.details << JournalDetail.new(:property => 'attr',
                      :prop_key => 'assigned_to_id',
                      :old_value => find_or_create_user(change.oldvalue),
                      :value => find_or_create_user(change.newvalue))
              else
                n.details << JournalDetail.new(:property => 'attr',
                      :prop_key => change.field,
                      :old_value => change.oldvalue,
                      :value => change.newvalue)
              end
            end
          end
        end
        n.save unless n.details.empty? && n.notes.blank?
			end

			# Attachments
      
      ticket.attachments.each do |attachment|
        if attachment.exist? 
          attachment.open {
            a = Attachment.new :created_on => attachment.time
            a.file = attachment
            a.author = find_or_create_user(attachment.author)
            a.container = i
            a.description = attachment.description
            migrated_ticket_attachments += 1 if a.save
          }
        else 

          nomigrated_ticket_attachments += 1 
          print "NO Migrado [#{attachment.description}]"

            file1 = File.new("Attach_no_migrados.txt","a+")
            #file1.puts nomigrated_ticket_attachments
            file1.write("Ticket: ")
            file1.puts ticket.id
            puts
            print 'Ticket No Mig: ' #{ticket.id} custom_field #{custom_field} custom_value #{custom.value}")
            puts ticket.id
        end
      end
  
      
		# Custom fields
			custom_values = ticket.customs.inject({}) do |h, custom|
      if custom_field = custom_field_map[custom.name]
        if (custom.name == 'revision_desa' || custom.name == 'revision_inte' || custom.name == 'revision_test') && !custom.value.blank?
          #revision = custom.value
          #revision = revision.gsub('[','').gsub(']','')
          revision = custom.value.gsub('[','').gsub(']','').gsub(/(\d+)/) do |s|
            "[https://repositorio.siu.edu.ar/trac/guarani3w/changeset/#{s} #{s}]#{revision}".gsub('].',']')
          end
          h[custom_field.id] = revision.gsub('] ',']').gsub(' [','[').gsub(' ,','').gsub(', ','').gsub(',','').gsub('-','')
          STDOUT.flush
        else
          h[custom_field.id] = custom.value
        end
        migrated_custom_values += 1
      end
      h

			end
			if custom_field_map['resolution'] && !ticket.resolution.blank?
				custom_values[custom_field_map['resolution'].id] = ticket.resolution
			end
      # Guarda el link del ticket (del trac) de donde se migro
      if custom_field_map['Ticket Migrado'] 
		 		custom_values[custom_field_map['Ticket Migrado'].id] = "[http://repositorio.siu.edu.ar/trac/guarani3w/ticket/#{ticket.id} #{ticket.id}]"
		 	end
      # Severity
      if custom_field_map['severity'] && !ticket.severity.blank?
        custom_values[custom_field_map['severity'].id] = ticket.severity
      end
      

      if !ticket.version.blank? && custom_field_map['found_in_version']
            found_in = version_map[ticket.version]
            if !found_in.nil?
              puts "Issue #{i.id} found in #{found_in.name.to_s} (#{found_in.id.to_s}) - trac: #{ticket.version}"
              
            else
              #TODO: add better error management here...
              puts "Issue #{i.id} : #{ticket.version} is not a milestone "  
            end 
            custom_values[custom_field_map['found_in_version'].id] = found_in.id.to_s
            STDOUT.flush
          end
     
      
			i.custom_field_values = custom_values
			i.save_custom_field_values
		end

		# update issue id sequence if needed (postgresql)
		Issue.connection.reset_pk_sequence!(Issue.table_name) if Issue.connection.respond_to?('reset_pk_sequence!')

		puts

   	# Wiki
		print "Migrating wiki"
		if wiki.save
     # print "version [#{version}]"
			TracWikiPage.find(:all, :order => 'name, version').each do |page|
				# Do not migrate Trac manual wiki pages
        # print "version [#{page.version}]"
				next if TRAC_WIKI_PAGES.include?(page.name)
				wiki_edit_count += 1
				print '.'
				STDOUT.flush
				p = wiki.find_or_new_page(page.name)
				p.content = WikiContent.new(:page => p) if p.new_record?
				p.content.text = page.text
				p.content.author = find_or_create_user(page.author) unless page.author.blank? || page.author == 'trac'
				p.content.comments = page.comment
				Time.fake(page.time) { p.new_record? ? p.save : p.content.save }

				next if p.content.new_record?
				migrated_wiki_edits += 1
        
        puts
        
        # Attachments
        page.attachments.each do |attachment|
          next unless attachment.exist?
         #if attachment.exist?
         next if p.attachments.find_by_filename(attachment.filename.gsub(/^.*(\\|\/)/, '').gsub(/[^\w\.\-]/,'_')) # add only once per page
          attachment.open {
            a = Attachment.new :created_on => attachment.time
            a.file = attachment
            a.author = find_or_create_user(attachment.author)
            a.description = attachment.description
            a.container = p
            migrated_wiki_attachments += 1 if a.save
            file1 = File.new("Wiki_con_attach.txt","a+")
            #file1.puts nomigrated_ticket_attachments
            if page.version == 2
              file1.write("Pagina: [#{page.name}] ")
              file1.puts "  filename [#{a.filename}]  version [#{page.version}] "  
            end
            print '.'
          }         
        end
      end
          
			wiki.reload
			wiki.pages.each do |page|
				page.content.text = convert_wiki_text(page.content.text)
				Time.fake(page.content.updated_on) { page.content.save }
			end
		end
		puts


    
		puts
		puts "Components:      #{migrated_components}/#{TracComponent.count}"
		puts "Priorities:      #{migrated_priorities}"
		puts "Statuses:        #{migrated_statuses}"
		puts "Ticket Type:     #{migrated_ticket_types}"
    puts "Migrate Severity:#{migrated_severity}"
		puts "Milestones:      #{migrated_milestones}/#{TracMilestone.count}"
  # puts "Milestones:      #{migrated_version}/#{TracVersion.count}"
		puts "Tickets:         #{migrated_tickets}/#{TracTicket.count}"
		puts "Ticket files:    #{migrated_ticket_attachments}/" + TracAttachment.count(:conditions => {:type => 'ticket'}).to_s
		puts "Custom values:   #{migrated_custom_values}/#{TracTicketCustom.count}"
		puts "Wiki edits:      #{migrated_wiki_edits}/#{wiki_edit_count}"
		puts "Wiki files:      #{migrated_wiki_attachments}/" + TracAttachment.count(:conditions => {:type => 'wiki'}).to_s
		end

		def self.limit_for(klass, attribute)
			klass.columns_hash[attribute.to_s].limit
		end
    
    def self.encoding(charset)
			@ic = Iconv.new('UTF-8', charset)
			rescue Iconv::InvalidEncoding
			puts "Invalid encoding!"
			return false
		end
    
		def self.set_trac_directory(path)
			@@trac_directory = path
			raise "This directory doesn't exist!" unless File.directory?(path)
			raise "#{trac_attachments_directory} doesn't exist!" unless File.directory?(trac_attachments_directory)
			@@trac_directory
			rescue Exception => e
			puts e
			return false
		end

		def self.trac_directory
			@@trac_directory
		end

		def self.set_trac_adapter(adapter)
			return false if adapter.blank?
			raise "Unknown adapter: #{adapter}!" unless %w(sqlite sqlite3 mysql postgresql).include?(adapter)
			# If adapter is sqlite or sqlite3, make sure that trac.db exists
			raise "#{trac_db_path} doesn't exist!" if %w(sqlite sqlite3).include?(adapter) && !File.exist?(trac_db_path)
			@@trac_adapter = adapter
			rescue Exception => e
			puts e
			return false
		end

		def self.set_trac_db_host(host)
			return nil if host.blank?
			@@trac_db_host = host
		end

		def self.set_trac_db_port(port)
			return nil if port.to_i == 0
			@@trac_db_port = port.to_i
		end

		def self.set_trac_db_name(name)
			return nil if name.blank?
			@@trac_db_name = name
		end

		def self.set_trac_db_username(username)
			@@trac_db_username = username
		end

		def self.set_trac_db_password(password)
			@@trac_db_password = password
		end

		def self.set_trac_db_schema(schema)
			@@trac_db_schema = schema
		end

		mattr_reader :trac_directory, :trac_adapter, :trac_db_host, :trac_db_port, :trac_db_name, :trac_db_schema, :trac_db_username, :trac_db_password

		def self.trac_db_path; "#{trac_directory}/db/trac.db" end
		def self.trac_attachments_directory; "#{trac_directory}/attachments" end

		def self.target_project_identifier(identifier)
			project = Project.find_by_identifier(identifier)
			if !project
				# create the target project
				project = Project.new :name => identifier.humanize,
					:description => ''
				project.identifier = identifier
				puts "Unable to create a project with identifier '#{identifier}'!" unless project.save
				# enable issues and wiki for the created project
				project.enabled_module_names = ['issue_tracking', 'wiki']
			else
				puts
				puts "This project already exists in your Redmine database."
				print "Are you sure you want to append data to this project ? [Y/n] "
				STDOUT.flush
				exit if STDIN.gets.match(/^n$/i)
			end
			#project.trackers << TRACKER_BUG unless project.trackers.include?(TRACKER_BUG)
			#project.trackers << TRACKER_FEATURE unless project.trackers.include?(TRACKER_FEATURE)
			@target_project = project.new_record? ? nil : project
			@target_project.reload
		end

		def self.connection_params
			if %w(sqlite sqlite3).include?(trac_adapter)
				{
					:adapter => trac_adapter,
					:database => trac_db_path
				}
			else
				{
					:adapter => trac_adapter,
					:database => trac_db_name,
					:host => trac_db_host,
					:port => trac_db_port,
					:username => trac_db_username,
					:password => trac_db_password,
					:schema_search_path => trac_db_schema
				}
			end
		end

		def self.establish_connection
			constants.each do |const|
				klass = const_get(const)
				next unless klass.respond_to? 'establish_connection'
				klass.establish_connection connection_params
			end
		end
    def self.encoding(charset)
        @charset = charset
    end
    private
			def self.encode(text)
			@ic.iconv text
			rescue
			text
		end
    #def self.encode(text)
      #  text.to_s.force_encoding(@charset).encode('UTF-8')
    #end
  end

		puts
		if Redmine::DefaultData::Loader.no_data?
			puts "Redmine configuration need to be loaded before importing data."
			puts "Please, run this first:"
			puts
			puts "  rake redmine:load_default_data RAILS_ENV=\"#{ENV['RAILS_ENV']}\""
			exit
		end

		puts "WARNING: a new project will be added to Redmine during this process."
		#print "Are you sure you want to continue ? [y/N] "
		print "Are you sure you want to continue ? [Y/n] "
		STDOUT.flush
		#break unless STDIN.gets.match(/^y$/i)
		break if STDIN.gets.match(/^n$/i)
		puts

		def prompt(text, options = {}, &block)
			default = options[:default] || ''
			while true
				print "#{text} [#{default}]: "
				STDOUT.flush
				value = STDIN.gets.chomp!
				value = default if value.blank?
				break if yield value
			end
		end

		DEFAULT_PORTS = {'mysql' => 3306, 'postgresql' => 5432}

		prompt('Ruta de Trac', :default => '/var/trac/guarani3w') {|directory| TracMigrate.set_trac_directory directory.strip}
		prompt('Conector a la base de Trac (sqlite, sqlite3, mysql, postgresql)', :default => 'postgresql') {|adapter| TracMigrate.set_trac_adapter adapter}
		unless %w(sqlite sqlite3).include?(TracMigrate.trac_adapter)
			prompt(' - host', :default => 'localhost') {|host| TracMigrate.set_trac_db_host host}
			prompt(' - port', :default => DEFAULT_PORTS[TracMigrate.trac_adapter]) {|port| TracMigrate.set_trac_db_port port}
			prompt(' - base', :default => 'trac_guarani3w') {|name| TracMigrate.set_trac_db_name name}
			prompt(' - schema', :default => 'public') {|schema| TracMigrate.set_trac_db_schema schema}
			prompt(' - usuario', :default => 'afellay') {|username| TracMigrate.set_trac_db_username username}
			prompt(' - clave', :default => 'sarasa') {|password| TracMigrate.set_trac_db_password password}
		end
		prompt(' - codificacion', :default => 'UTF-8') {|encoding| TracMigrate.encoding encoding}
		prompt(' - identificador del proyecto', :default => 'guarani3w') {|identifier| TracMigrate.target_project_identifier identifier}
		puts
		puts

		# Turn off email notifications
		Setting.notified_events = []

		TracMigrate.migrate
	end
end
