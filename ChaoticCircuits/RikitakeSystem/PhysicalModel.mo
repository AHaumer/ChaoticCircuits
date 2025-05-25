within ChaoticCircuits.RikitakeSystem;
model PhysicalModel "Rikitake system"
  extends Modelica.Icons.Example;
  parameter Real mu=0.4 "Resistive parameter";
  parameter Real D =2 "Speed difference";
  parameter MachineData machineData(mu=mu)
    annotation (Placement(transformation(extent={{-10,70},{10,90}})));
  //shortcut to results
  Real x1(start=0.001, fixed=true)=emf1.i/machineData.iRef "Current 1";
  Real x2(start=0.001, fixed=true)=emf2.i/machineData.iRef "Current 2";
  Real z(start=1, fixed=true)=emf1.w/machineData.wRef "Speed";
  Components.RotationalEMF emf1(M=machineData.M)
    annotation (Placement(transformation(extent={{-20,-10},{-40,10}})));
  Components.RotationalEMF emf2(M=machineData.M)
    annotation (Placement(transformation(extent={{20,-10},{40,10}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor1(R=machineData.R)
                                                      annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-50,30})));
  Modelica.Electrical.Analog.Basic.Inductor inductor1(L=machineData.L)
                                                      annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-50,60})));
  Modelica.Electrical.Analog.Basic.Inductor inductor2(L=machineData.L)
                                                      annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={50,60})));
  Modelica.Electrical.Analog.Basic.Resistor resistor2(R=machineData.R)
                                                      annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={50,30})));
  Modelica.Electrical.Analog.Basic.Ground ground1
    annotation (Placement(transformation(extent={{-40,-40},{-20,-20}})));
  Modelica.Electrical.Analog.Basic.Ground ground2
    annotation (Placement(transformation(extent={{20,-40},{40,-20}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1(J=machineData.J)
    annotation (Placement(transformation(extent={{-50,-10},{-70,10}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia2(J=machineData.J)
    annotation (Placement(transformation(extent={{50,-10},{70,10}})));
  Modelica.Mechanics.Rotational.Sources.ConstantTorque torque1(tau_constant=
        machineData.tau)
    annotation (Placement(transformation(extent={{-100,-10},{-80,10}})));
  Modelica.Mechanics.Rotational.Sources.ConstantTorque torque2(tau_constant=
        machineData.tau)
    annotation (Placement(transformation(extent={{100,-10},{80,10}})));
  Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor1 annotation
    (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-30,40})));
  Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor2 annotation
    (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=90,
        origin={30,40})));
initial equation
  emf2.w/machineData.wRef=1 - D;
equation
  connect(resistor1.n, emf1.pa)
    annotation (Line(points={{-50,20},{-50,10},{-30,10}}, color={0,0,255}));
  connect(inductor1.n, resistor1.p)
    annotation (Line(points={{-50,50},{-50,40}}, color={0,0,255}));
  connect(inductor2.n, resistor2.p)
    annotation (Line(points={{50,50},{50,40}}, color={0,0,255}));
  connect(resistor2.n, emf2.pa)
    annotation (Line(points={{50,20},{50,10},{30,10}}, color={0,0,255}));
  connect(emf1.na, ground1.p)
    annotation (Line(points={{-30,-10},{-30,-20}}, color={0,0,255}));
  connect(emf2.na, ground2.p)
    annotation (Line(points={{30,-10},{30,-20}}, color={0,0,255}));
  connect(emf2.flange, inertia2.flange_a)
    annotation (Line(points={{40,0},{50,0}}, color={0,0,0}));
  connect(inertia1.flange_a, emf1.flange)
    annotation (Line(points={{-50,0},{-40,0}}, color={0,0,0}));
  connect(torque1.flange, inertia1.flange_b)
    annotation (Line(points={{-80,0},{-70,0}}, color={0,0,0}));
  connect(torque2.flange, inertia2.flange_b)
    annotation (Line(points={{80,0},{70,0}}, color={0,0,0}));
  connect(currentSensor2.i, emf1.ie) annotation (Line(points={{19,40},{6,40},{6,
          36},{-2,36},{-2,0},{-20,0}},     color={0,0,127}));
  connect(currentSensor1.i, emf2.ie) annotation (Line(points={{-19,40},{2,40},{2,
          0},{20,0}},                        color={0,0,127}));
  connect(inductor2.p, currentSensor2.p)
    annotation (Line(points={{50,70},{30,70},{30,50}}, color={0,0,255}));
  connect(currentSensor2.n, ground2.p) annotation (Line(points={{30,30},{30,20},
          {10,20},{10,-20},{30,-20}}, color={0,0,255}));
  connect(inductor1.p, currentSensor1.p)
    annotation (Line(points={{-50,70},{-30,70},{-30,50}}, color={0,0,255}));
  connect(currentSensor1.n, ground1.p) annotation (Line(points={{-30,30},{-30,20},
          {-10,20},{-10,-20},{-30,-20}}, color={0,0,255}));
  annotation (experiment(
      StopTime=15,
      Interval=0.0005,
      Tolerance=1e-06), Documentation(info="<html>
<p>See documentation of the <a href=\"modelica://ChaoticCircuits.RikitakeSystem\">enclosing subpackage</a>.</p>
<p>
The experiment could be implemented in reality by two series excited DC machines, using the negative armature current of the other machine as excitation current. 
Unfortunately two torque sources (current controlled electric drives) are needed.
</p>
<h4>Note</h4>
<p>
When defining different machine parameters, the dynamics of the machines and therefore the time scaling <code>machineData.tRef</code> 
defined by mechanical and electrical time constant will change and it might be necessary to adapt StopTime and Interval in the experiment annotation.
</p>
</html>"),
    Diagram(graphics={Text(
          extent={{-80,-80},{80,-100}},
          textColor={0,0,255},
          textString="Path to chaos: mu={0.4, 0.6, 0.8}")}));
end PhysicalModel;
