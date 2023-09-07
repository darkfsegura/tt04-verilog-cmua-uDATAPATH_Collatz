/*######################################################################
//#	G0B1T: HDL EXAMPLES. 2018.
//######################################################################
//# Copyright (C) 2018. F.E.Segura-Quijano (FES) fsegura@uniandes.edu.co
//# 
//# This program is free software: you can redistribute it and/or modify
//# it under the terms of the GNU General Public License as published by
//# the Free Software Foundation, version 3 of the License.
//#
//# This program is distributed in the hope that it will be useful,
//# but WITHOUT ANY WARRANTY; without even the implied warranty of
//# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//# GNU General Public License for more details.
//#
//# You should have received a copy of the GNU General Public License
//# along with this program.  If not, see <http://www.gnu.org/licenses/>
//####################################################################*/
//=======================================================
//  MODULE Definition
//=======================================================
module CC_DECODER #(parameter DATAWIDTH_DECODER_SELECTION=3, parameter DATAWIDTH_DECODER_OUT=4)(
	//////////// OUTPUTS //////////
	CC_DECODER_datadecoder_OutBUS,
	//////////// INPUTS //////////
	CC_DECODER_selection_InBUS
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output reg	[DATAWIDTH_DECODER_OUT-1:0] CC_DECODER_datadecoder_OutBUS;
input		[DATAWIDTH_DECODER_SELECTION-1:0] CC_DECODER_selection_InBUS;
//=======================================================
//  REG/WIRE declarations
//=======================================================

//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
always@(*)
begin
	case (CC_DECODER_selection_InBUS)	
		3'b000: CC_DECODER_datadecoder_OutBUS = 4'b1110;
		3'b001: CC_DECODER_datadecoder_OutBUS = 4'b1101;
		3'b010: CC_DECODER_datadecoder_OutBUS = 4'b1011;
		3'b011: CC_DECODER_datadecoder_OutBUS = 4'b0111;
		3'b111: CC_DECODER_datadecoder_OutBUS = 4'b1111;
		default : CC_DECODER_datadecoder_OutBUS = 4'b1111; 
	endcase
end
//=======================================================
//  Outputs
//=======================================================
// OUTPUT LOGIC : COMBINATIONAL

endmodule
