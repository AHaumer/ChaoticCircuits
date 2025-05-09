within ChaoticCircuits.ParameterSets;
record NIC_Shinriki "NIC for Shinriki"
  extends NICData(
    Type="NIC Shinriki",
    Vs=15,
    R=4700,
    Rg=6800);
    annotation(defaultComponentName="nicData", defaultComponentPrefixes="parameter",
    Icon(graphics={Text(
          extent={{-100,-10},{100,-40}},
          textColor={28,108,200},
          textString="%Type")}));
end NIC_Shinriki;
