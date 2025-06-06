within ChaoticCircuits.LotkaVolterra.ParameterSets;
record LotkaVolterraVano "4-dim. Lotka-Volterra Vano"
  extends ChaoticCircuits.LotkaVolterra.ParameterSets.PredatorPrey     (
    id="Lotka-Volterra Vano",
    n=4,
    r={1,0.72,1.53,1.27},
    a={{1,1.09,1.52,0},{0,1,0.44,1.36},{2.33,0,1,0.47},{1.21,0.51,0.35,1}},
    x0={0.3013,0.4586,0.1307,0.3557});
  annotation(defaultComponentPrefixes="paramdeter", defaultComponentName="data",
    Documentation(info="<html>
<p>Parameter record for the <a href=\"modelica://ChaoticCircuits.LotkaVolterra.LotkaVolterra\">Lotka-Volterra model</a>.</p>
</html>"));
end LotkaVolterraVano;
