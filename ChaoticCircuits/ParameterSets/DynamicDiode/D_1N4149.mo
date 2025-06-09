within ChaoticCircuits.ParameterSets.DynamicDiode;
record D_1N4149 "Diode 1N4149 Small-signal diode"
  extends ChaoticCircuits.ParameterSets.DynamicDiode.DynamicDiodeData(
    Type="1N4149",
    IFav=0.5,
    VRrm=-100,
    Ids=2.5e-9,
    nVt=1.84*25e-3,
    C0=5e-12,
    V0=0.5,
    m=0.333,
    fc=0.5,
    TauT=11.5e-9);
   annotation(defaultComponentPrefixes="parameter");
end D_1N4149;
