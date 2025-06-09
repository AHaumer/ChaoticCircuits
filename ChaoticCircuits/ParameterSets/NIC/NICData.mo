within ChaoticCircuits.ParameterSets.NIC;
record NICData "Parameter for negative impedance converter"
  extends Modelica.Icons.Record;
  parameter String Type="NIC";
  parameter Real V0=15000 "No-load amplification of opAmp";
  parameter SI.Voltage Vs "Supply voltage";
  parameter SI.Resistance R "NIC pos and neg feedback resistance";
  parameter SI.Resistance Rg "NIC resistance to ground";
  parameter SI.Voltage VLim=Vs*Rg/(Rg + R) "Left and right corner voltage"
    annotation(Dialog(group="Results"));
  parameter SI.Current ILim=Vs/(Rg + R) "Left and right corner current"
    annotation(Dialog(group="Results"));
  parameter SI.Conductance gPos=1/R "Positive differential conductance"
    annotation(Dialog(group="Results"));
  parameter SI.Conductance gNeg=-1/Rg "Negative (inner) conductance"
    annotation(Dialog(group="Results"));
    annotation(defaultComponentName="nicData", defaultComponentPrefixes="parameter",
    Icon(graphics={Text(
          extent={{-100,-10},{100,-40}},
          textColor={28,108,200},
          textString="%Type")}),
    Documentation(info="<html>
<p>
This record calculates the analytic parameters from source voltage and resistances of the implementation with opAmps. 
Looking at the formula, it is easy to design the opAmp circuit from desired analytic parameters:
</p>
<p><code>
R =  1/gPos<br>
Rg= -1/gNeg<br>
Vs= VLim*(Rg + R)/Rg
</code></p>
</html>"));
end NICData;
