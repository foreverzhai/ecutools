##
# ecutools: IoT Automotive Tuning, Diagnostics & Analytics
# Copyright (C) 2014 Jeremy Hahn
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

require 'spec_helper'

describe Ecutools::J2534 do
  include_context 'J2534' do
    context 'PassThruConnect' do
 
      it 'returns ERR_PIN_NOT_SUPPORTED when passed an invalid or unknown pin and/or connector' do
        things.test_with_ecutuned {

          expect(j2534.PassThruOpen(things[0][:name], 1)).to eq(true)

          resource = Ecutools::J2534::Models::Resource.new
          resource.Connector = 0

          expect {
            j2534.PassThruConnect(1, Ecutools::J2534::CAN, Ecutools::J2534::CAN_ID_BOTH, 500000, resource, 1)
          }.to raise_error Ecutools::J2534Error, /ERR_PIN_NOT_SUPPORTED/
        }
      end

    end
  end
end
