within ChaoticCircuits.Test;
model TestNIC "Test negative impedance converter"
  extends Modelica.Icons.Example;
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-10,-40},{10,-20}})));
  Modelica.Electrical.Analog.Sources.TrapezoidVoltage
                                                 source(
    V=60,
    rising=0.25,
    width=0,
    falling=0.25,
    period=0.5,
    nperiod=2,
    offset=-30) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270)));
  Components.IdealNIC idealNIC(redeclare
      ChaoticCircuits.ParameterSets.NIC_Shinriki nicData)
           annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-30,0})));
  Components.ImprovedNIC
                      improvedNIC(nicData=idealNIC.nicData)
           annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={30,0})));
equation
  connect(ground.p, source.n)
    annotation (Line(points={{0,-20},{0,-10}},     color={0,0,255}));
  connect(source.p, idealNIC.p) annotation (Line(points={{0,10},{0,20},{-30,20},
          {-30,10}},     color={0,0,255}));
  connect(ground.p, idealNIC.n)
    annotation (Line(points={{0,-20},{-30,-20},{-30,-10}},   color={0,0,255}));
  connect(source.p, improvedNIC.p)
    annotation (Line(points={{0,10},{0,20},{30,20},{30,10}}, color={0,0,255}));
  connect(ground.p, improvedNIC.n)
    annotation (Line(points={{0,-20},{30,-20},{30,-10}}, color={0,0,255}));
  annotation (Documentation(info="<html>
<p>Plot idealNIC.i and improvedNIC.i vs. source.v to see the i(v)-characteristic of the NIC (negative impedance converter).</p>
</html>"), experiment(
      StopTime=1,
      Interval=0.0001,
      Tolerance=1e-06));
end TestNIC;
