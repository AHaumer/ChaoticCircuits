within ChaoticCircuits.ParameterSets.DynamicDiode;
record D_1N4003 "Diode 1N4003 Rectifier diode"
  extends ChaoticCircuits.ParameterSets.DynamicDiode.DynamicDiodeData(
    Type="1N4003",
    IFav=1.0,
    VRrm=-200,
    Ids=70e-12,
    nVt=1.4*25e-3,
    C0=33e-12,
    V0=0.35,
    m=0.45,
    fc=0.5,
    TauT=5000e-9);
   annotation(defaultComponentPrefixes="parameter");
end D_1N4003;
