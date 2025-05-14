within ChaoticCircuits.Test;
model TestHystereticNIC "Test negative impedance converter"
  extends Modelica.Icons.Example;
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-10,-40},{10,-20}})));
  Modelica.Electrical.Analog.Sources.TrapezoidCurrent
                                                 source(
    I=6e-3,
    rising=0.25,
    width=0,
    falling=0.25,
    period=0.5,
    nperiod=2,
    offset=-3e-3)
                annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270)));
  Components.HystereticNIC
                      hystereticNIC(
                               redeclare
      ChaoticCircuits.ParameterSets.NIC_Shinriki nicData)
           annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-30,0})));
equation
  connect(ground.p, hystereticNIC.n)
    annotation (Line(points={{0,-20},{-30,-20},{-30,-10}}, color={0,0,255}));
  connect(ground.p, source.p)
    annotation (Line(points={{0,-20},{0,-10}}, color={0,0,255}));
  connect(source.n, hystereticNIC.p) annotation (Line(points={{0,10},{0,20},{
          -30,20},{-30,10}}, color={0,0,255}));
  annotation (Documentation(info="<html>
<p>Plot hystereticNIC.v vs. source.i to see the v(i)-characteristic of the NIC (negative impedance converter).</p>
</html>"), experiment(
      StopTime=1.0,
      Interval=0.0001,
      Tolerance=1e-06));
end TestHystereticNIC;
