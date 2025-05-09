within ChaoticCircuits.ParameterSets;
record NIC_Chua1 "NIC1 for Chua"
  extends NICData(
    Type="NIC1 Chua",
    Vs=12,
    R=220,
    Rg=2200);
    annotation(defaultComponentName="nicData", defaultComponentPrefixes="parameter",
    Icon(graphics={Text(
          extent={{-100,-10},{100,-40}},
          textColor={28,108,200},
          textString="%Type")}));
end NIC_Chua1;
