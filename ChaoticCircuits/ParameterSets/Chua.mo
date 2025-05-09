within ChaoticCircuits.ParameterSets;
record Chua "Parameter for Chuas diode"
  extends Modelica.Icons.Record;
  parameter String Type="Chua";
  replaceable parameter NIC_Chua1 nicData1
    constrainedby ChaoticCircuits.ParameterSets.NICData
    annotation(choicesAllMatching=true);
  replaceable parameter NIC_Chua2 nicData2
    constrainedby ChaoticCircuits.ParameterSets.NICData
    annotation(choicesAllMatching=true);
    annotation(defaultComponentName="nicData", defaultComponentPrefixes="parameter",
    Icon(graphics={Text(
          extent={{-100,-10},{100,-40}},
          textColor={28,108,200},
          textString="%Type")}));
end Chua;
