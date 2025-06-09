within ChaoticCircuits.ParameterSets;
record ChuaData "Parameter for Chuas diode"
  extends Modelica.Icons.Record;
  parameter String Type="Chua";
  parameter Real V0=15000 "No-load amplification of opAmp";
  parameter SI.Voltage Vs=12 "Supply voltage";
  replaceable parameter NIC.NIC_Chua1 nicData1(V0=V0, Vs=Vs) constrainedby
    ChaoticCircuits.ParameterSets.NIC.NICData
    annotation(choicesAllMatching=true);
  replaceable parameter NIC.NIC_Chua2 nicData2(V0=V0, Vs=Vs) constrainedby
    ChaoticCircuits.ParameterSets.NIC.NICData
    annotation(choicesAllMatching=true);
  parameter SI.Voltage Ve=min(nicData1.VLim, nicData2.VLim) "Inner limit"
    annotation(Dialog(group="Results"));
  parameter SI.Conductance Ga=nicData1.gNeg + nicData2.gNeg "Inner slope"
    annotation(Dialog(group="Results"));
  parameter SI.Conductance Gb=if nicData1.VLim<nicData2.VLim
    then nicData1.gPos + nicData2.gNeg else nicData1.gNeg + nicData2.gPos "Intermediate slope"
    annotation(Dialog(group="Results"));
  parameter SI.Conductance Gc=nicData1.gPos + nicData2.gPos "Outer slope"
    annotation(Dialog(group="Results"));
  parameter SI.Voltage Vp=max(nicData1.VLim, nicData2.VLim) "Voltage peak"
    annotation(Dialog(group="Results"));
    annotation(defaultComponentName="chuaData", defaultComponentPrefixes="parameter",
    Icon(graphics={Text(
          extent={{-100,-10},{100,-40}},
          textColor={28,108,200},
          textString="%Type")}),
    Documentation(info="<html>
<p>
The Chua diode can be implemented from 2 NICs, either <a href=\"modelica://ChaoticCircuits.Components.IdealNIC\">ideal</a> or as 
<a href=\"modelica://ChaoticCircuits.Components.ImprovedNIC\">opAmp-circuit</a>. 
Therefore this parameter record contains 2 <a href=\"modelica://ChaoticCircuits.ParameterSets.NIC.NICData\">NIC parameter records</a> 
and calculates analytic parameters. 
Looking at the formula, it is possible to design the NICs from desired analytic parameters:
</p>
<p><code>
Ve =  NIC1.VLim = Vs*NIC1.Rg/(NIC1.Rg + NIC1.R)<br>
Ga = -1/NIC1.Rg - 1/NIC2.Rg<br>
Gb =  1/NIC1.R  - 1/NIC2.Rg<br>
Gc =  1/NIC1.R  + 1/NIC2.R<br>
Vp =  NIC2.VLim = Vs*NIC2.Rg/(NIC2.Rg + NIC2.R)
</code></p>
<p>
Thease are 5 equations for 5 parameters: NIC1.{R, Rg}, NIC2.{R, Rg} and Vs.
</p>
</html>"));
end ChuaData;
