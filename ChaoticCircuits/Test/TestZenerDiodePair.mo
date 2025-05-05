within ChaoticCircuits.Test;
model TestZenerDiodePair "Test the Zener diode pair"
  extends Modelica.Icons.Example;
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={30,-50})));
  Modelica.Electrical.Analog.Sources.RampVoltage rampVoltage(
    V=12,
    duration=5,
    offset=-6)
    annotation (Placement(transformation(extent={{-50,-50},{-30,-30}})));
  Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor1 annotation (
      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={-40,40})));
  Components.ZenerDiodePairApproximation zDiodePair
    annotation (Placement(transformation(extent={{-10,30},{10,50}})));
  Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor2 annotation (
      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={-40,0})));
  Modelica.Electrical.Analog.Semiconductors.ZDiode diode21(
    Ids=1e-05,
    Maxexp=5,
    Bv=4.3,
    Ibv=0.001,
    Nbv=5,
    v(start=0))
    annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  Modelica.Electrical.Analog.Semiconductors.ZDiode diode22(
    Ids=1e-05,
    Maxexp=5,
    Bv=4.3,
    Ibv=0.001,
    Nbv=5) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={20,0})));
equation
  connect(rampVoltage.n, ground.p)
    annotation (Line(points={{-30,-40},{30,-40}}, color={0,0,255}));
  connect(rampVoltage.p, currentSensor2.p)
    annotation (Line(points={{-50,-40},{-50,0}}, color={0,0,255}));
  connect(currentSensor2.n, diode21.p)
    annotation (Line(points={{-30,0},{-20,0}}, color={0,0,255}));
  connect(diode21.n, diode22.n)
    annotation (Line(points={{0,0},{10,0}}, color={0,0,255}));
  connect(ground.p, diode22.p)
    annotation (Line(points={{30,-40},{30,0}}, color={0,0,255}));
  connect(rampVoltage.p,currentSensor1. p)
    annotation (Line(points={{-50,-40},{-50,40}}, color={0,0,255}));
  connect(currentSensor1.n, zDiodePair.p)
    annotation (Line(points={{-30,40},{-10,40}}, color={0,0,255}));
  connect(ground.p, zDiodePair.n)
    annotation (Line(points={{30,-40},{30,40},{10,40}}, color={0,0,255}));
  annotation (Documentation(info="<html>
<p>Plot currentSensor<i>n</i>.i vs. rampVoltage.v to see the i(v)-characteristic of the zener diode pair, and compare:</p>
<ul>
  <li>n=1 ... Approximation from <a href=\"modelica://ChaoticCircuits.UsersGuide.References\"> [Lueck1995] </a></li>
  <li>n=2 ... Modelica.Electrical.Analog.Semiconductors.ZDiode</li>
</ul>
</html>"), experiment(
      StopTime=5,
      Interval=1e-3,
      Tolerance=1e-06));
end TestZenerDiodePair;
