within ChaoticCircuits.Test;
model TestZenerDiode "Test the Zener diode"
  extends Modelica.Icons.Example;
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={30,-90})));
  Modelica.Electrical.Analog.Sources.RampVoltage rampVoltage(
    V=12,
    duration=5,
    offset=-6)
    annotation (Placement(transformation(extent={{-50,-90},{-30,-70}})));
  Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor0 annotation (
      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={-40,40})));
  Components.ZenerDiodePairApproximation zDiodePair
    annotation (Placement(transformation(extent={{-10,30},{10,50}})));
  Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor1 annotation (
      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={-40,0})));
  Components.SimpleZenerDiode diode11(
    Ron=15,
    Goff=0.0001,
    V_bt=-4.8,
    R_bt=15) annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  Components.SimpleZenerDiode diode12(
    Ron=15,
    Goff=0.0001,
    V_bt=-4.8,
    R_bt=15) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={20,0})));
  Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor2 annotation (
      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={-40,-40})));
  Modelica.Electrical.Analog.Semiconductors.ZDiode diode21(
    Ids=1e-05,
    Maxexp=5,
    Bv=4.3,
    Ibv=0.001,
    Nbv=5,
    v(start=0))
    annotation (Placement(transformation(extent={{-20,-50},{0,-30}})));
  Modelica.Electrical.Analog.Semiconductors.ZDiode diode22(
    Ids=1e-05,
    Maxexp=5,
    Bv=4.3,
    Ibv=0.001,
    Nbv=5) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={20,-40})));
equation
  connect(diode11.n, diode12.n)
    annotation (Line(points={{0,0},{10,0}},   color={0,0,255}));
  connect(diode12.p, ground.p)
    annotation (Line(points={{30,0},{30,-80}},  color={0,0,255}));
  connect(currentSensor1.n, diode11.p)
    annotation (Line(points={{-30,0},{-20,0}},   color={0,0,255}));
  connect(rampVoltage.n, ground.p)
    annotation (Line(points={{-30,-80},{30,-80}}, color={0,0,255}));
  connect(rampVoltage.p, currentSensor2.p)
    annotation (Line(points={{-50,-80},{-50,-40}},
                                                 color={0,0,255}));
  connect(rampVoltage.p, currentSensor1.p)
    annotation (Line(points={{-50,-80},{-50,0}},  color={0,0,255}));
  connect(currentSensor2.n, diode21.p)
    annotation (Line(points={{-30,-40},{-20,-40}},
                                               color={0,0,255}));
  connect(diode21.n, diode22.n)
    annotation (Line(points={{0,-40},{10,-40}},
                                            color={0,0,255}));
  connect(ground.p, diode22.p)
    annotation (Line(points={{30,-80},{30,-40}},
                                               color={0,0,255}));
  connect(rampVoltage.p, currentSensor0.p)
    annotation (Line(points={{-50,-80},{-50,40}}, color={0,0,255}));
  connect(currentSensor0.n, zDiodePair.p)
    annotation (Line(points={{-30,40},{-10,40}}, color={0,0,255}));
  connect(ground.p, zDiodePair.n)
    annotation (Line(points={{30,-80},{30,40},{10,40}}, color={0,0,255}));
  annotation (Documentation(info="<html>
<p>Plot currentSensor<i>n</i>.i vs. rampVoltage.v to see the i(v)-characteristic of the zener diode pair, and compare:</p>
<ul>
  <li>n=0 ... Approximation from <a href=\"modelica://ChaoticCircuits.UsersGuide.References\"> [Lueck1995] </a></li>
  <li>n=1 ... SimpleZenerDiode</li>
  <li>n=2 ... Modelica.Electrical.Analog.Semiconductors.ZDiode</li>
</ul>
</html>"), experiment(
      StopTime=5,
      Interval=1e-3,
      Tolerance=1e-06),
    Diagram(graphics={Text(
          extent={{-80,90},{80,50}},
          textColor={28,108,200},
          textString="Note: expected function of the Shinriki oscillator only with 
Modelica.Electrical.Analog.Semiconductors.ZDiode
or Components.ZenerDiodePairApproximation")}));
end TestZenerDiode;
