#############################################################################
# Copyright © 2009 Dan Wanek <dan.wanek@gmail.com>
#
#
# This file is part of Viewpoint.
# 
# Viewpoint is free software: you can redistribute it and/or
# modify it under the terms of the GNU General Public License as published
# by the Free Software Foundation, either version 3 of the License, or (at
# your option) any later version.
# 
# Viewpoint is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General
# Public License for more details.
# 
# You should have received a copy of the GNU General Public License along
# with Viewpoint.  If not, see <http://www.gnu.org/licenses/>.
#############################################################################
$:.unshift(File.dirname(__FILE__))
require 'item'

class Message < Item

	attr_reader :subject, :parent_folder, :sender, :date_time_recieved
	attr_reader :ews_item if $DEBUG

	# Initialize an Exchange Web Services item
	def initialize(ews_item, parent_folder)
		# keep this now for debuging
		@ews_item = ews_item if $DEBUG
		@subject = ews_item.subject # String
		@folder = parent_folder # MailFolder
		@sender = ews_item.sender.mailbox.name # String
		@is_read = ews_item.isRead  # boolean
		@date_time_recieved = ews_item.dateTimeReceived # DateTime

		super(ews_item)
	end

end
