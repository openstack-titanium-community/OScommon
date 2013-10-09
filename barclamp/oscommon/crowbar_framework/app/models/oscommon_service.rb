# Copyright 2011, Dell 
# Copyright 2012, Dell
# 
# Licensed under the Apache License, Version 2.0 (the "License"); 
# you may not use this file except in compliance with the License. 
# You may obtain a copy of the License at 
# 
#  http://www.apache.org/licenses/LICENSE-2.0 
# 
# Unless required by applicable law or agreed to in writing, software 
# distributed under the License is distributed on an "AS IS" BASIS, 
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
# See the License for the specific language governing permissions and 
# limitations under the License. 
# 

class OscommonService < ServiceObject

  def initialize(thelogger)
    @bc_name = "oscommon"
    @logger = thelogger
  end

  def create_proposal
    # TODO: ensure that only one proposal can be applied to a node
    @logger.debug("oscommon create_proposal: entering")
    base = super
    @logger.debug("oscommon create_proposal: leaving base part")

    nodes = NodeObject.all
    nodes.delete_if { |n| not n.admin? }
    unless nodes.empty?
      base["deployment"]["oscommon"]["elements"] = {
        "oscommon" => [ nodes.first.name ]
      }
    end

    @logger.debug("oscommon create_proposal: exiting")
    base
  end

end

