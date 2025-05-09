within ChaoticCircuits.ParameterSets;
record NICData "Parameter for negative impedance converter"
  extends Modelica.Icons.Record;
  parameter String Type="NIC";
  parameter SI.Voltage Vs "Supply voltage";
  parameter SI.Resistance R "NIC pos and neg feedback resistance";
  parameter SI.Resistance Rg "NIC resistance to ground";
  parameter SI.Voltage VLim=Vs*Rg/(Rg + R) "Left and right corner voltage"
    annotation(Dialog(group="Results"));
  parameter SI.Conductance gPos=1/R "Positive differential conductance"
    annotation(Dialog(group="Results"));
  parameter SI.Conductance gNeg=-1/Rg "Negative differential conductance"
    annotation(Dialog(group="Results"));
    annotation(defaultComponentName="nicData", defaultComponentPrefixes="parameter",
    Icon(graphics={Text(
          extent={{-100,-10},{100,-40}},
          textColor={28,108,200},
          textString="%Type")}));
end NICData;
