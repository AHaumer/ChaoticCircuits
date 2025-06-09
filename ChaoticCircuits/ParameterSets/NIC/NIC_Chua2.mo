within ChaoticCircuits.ParameterSets.NIC;
record NIC_Chua2 "NIC2 for Chua"
  extends NIC.NICData(
    Type="NIC2 Chua",
    Vs=12,
    R=22000,
    Rg=3300);
    annotation(defaultComponentName="nicData", defaultComponentPrefixes="parameter",
    Icon(graphics={Text(
          extent={{-100,-10},{100,-40}},
          textColor={28,108,200},
          textString="%Type")}));
end NIC_Chua2;
