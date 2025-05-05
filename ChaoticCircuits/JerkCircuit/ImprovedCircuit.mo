within ChaoticCircuits.JerkCircuit;
model ImprovedCircuit "The Jerk equation"
  extends Modelica.Icons.Example;
  parameter Real A=0.3 "Parameter to be varied";
  parameter SI.Resistance R=1e3 "Resistance";
  parameter SI.Capacitance C=1e-6 "Capacitance";
  parameter SI.Current Ids=1e-12 "Diode: saturation current";
  parameter SI.Voltage nVt=26e-3 "Diode: n * voltage equivalent of temperature";
  parameter SI.Voltage Vs=9 "Supply voltage";
  //shortcut to results
  SI.Voltage x=opAmp_x.out.v "Result: x";
  SI.Voltage y=opAmp_y.out.v "Result: y=der(x)";
  SI.Voltage z=opAmp_z.out.v "Result: z=der(y)";
  Components.IdealizedOpAmp3Pin opAmp_z(Vps=+Vs, Vns=-Vs)
    annotation (Placement(transformation(extent={{-70,-40},{-50,-20}})));
  Modelica.Electrical.Analog.Basic.Capacitor c_z(v(start=0.001, fixed=true), C= C)
    annotation (Placement(transformation(extent={{-50,-20},{-70,0}})));
  Modelica.Electrical.Analog.Basic.Resistor r_zz(R=R/A)
    annotation (Placement(transformation(extent={{-50,0},{-70,20}})));
  Components.IdealizedOpAmp3Pin opAmp_invy(Vps=+Vs, Vns=-Vs)
    annotation (Placement(transformation(extent={{-10,-40},{10,-20}})));
  Modelica.Electrical.Analog.Basic.Resistor r_yz(R=R)
    annotation (Placement(transformation(extent={{-40,-34},{-20,-14}})));
  Modelica.Electrical.Analog.Basic.Capacitor c_y(v(start=-0.001, fixed=true), C=C)
    annotation (Placement(transformation(extent={{10,-20},{-10,0}})));
  Components.IdealizedOpAmp3Pin opAmp_x(Vps=+Vs, Vns=-Vs)
    annotation (Placement(transformation(extent={{50,-40},{70,-20}})));
  Modelica.Electrical.Analog.Basic.Capacitor c_x(v(start=0.001, fixed=true), C= C)
    annotation (Placement(transformation(extent={{70,-20},{50,0}})));
  Modelica.Electrical.Analog.Basic.Resistor r_xy(R=R)
    annotation (Placement(transformation(extent={{20,-34},{40,-14}})));
  Components.IdealizedOpAmp3Pin opAmp_y(Vps=+Vs, Vns=-Vs)
    annotation (Placement(transformation(extent={{-20,20},{-40,40}})));
  Modelica.Electrical.Analog.Basic.Resistor r_1(R=R)
    annotation (Placement(transformation(extent={{10,26},{-10,46}})));
  Modelica.Electrical.Analog.Basic.Resistor r_2(R=R)
    annotation (Placement(transformation(extent={{-40,40},{-20,60}})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-30,-10},{-10,10}})));
  Modelica.Electrical.Analog.Basic.Ground ground_xyz
    annotation (Placement(transformation(extent={{-10,-70},{10,-50}})));
  Modelica.Electrical.Analog.Semiconductors.Diode2 diode(Ids=Ids, Vt=nVt)
    annotation (Placement(transformation(extent={{-50,20},{-70,40}})));
  Modelica.Electrical.Analog.Basic.Resistor r_zx(R=R)
    annotation (Placement(transformation(extent={{10,60},{-10,80}})));
protected
  //further initialization
  SI.Voltage vd(start=0)=diode.vd "Voltage of diode";
  SI.Voltage v_x(start=0)=opAmp_x.v_in.v;
  SI.Voltage v_invy(start=0)=opAmp_invy.v_in.v;
  SI.Voltage v_z(start=0)=opAmp_z.v_in.v;
  SI.Current i_r_1(start=0)=r_1.i;
equation
  connect(opAmp_z.out, c_z.p)
    annotation (Line(points={{-50,-30},{-50,-10}}, color={0,0,255}));
  connect(c_z.p, r_zz.p)
    annotation (Line(points={{-50,-10},{-50,10}}, color={0,0,255}));
  connect(opAmp_z.in_n, c_z.n)
    annotation (Line(points={{-70,-24},{-70,-10}}, color={0,0,255}));
  connect(c_z.n, r_zz.n)
    annotation (Line(points={{-70,-10},{-70,10}}, color={0,0,255}));
  connect(c_y.n, opAmp_invy.in_n)
    annotation (Line(points={{-10,-10},{-10,-24}}, color={0,0,255}));
  connect(c_y.p, opAmp_invy.out)
    annotation (Line(points={{10,-10},{10,-30}}, color={0,0,255}));
  connect(opAmp_z.out, r_yz.p)
    annotation (Line(points={{-50,-30},{-40,-30},{-40,-24}}, color={0,0,255}));
  connect(r_yz.n, opAmp_invy.in_n)
    annotation (Line(points={{-20,-24},{-10,-24}}, color={0,0,255}));
  connect(opAmp_invy.out, r_xy.p)
    annotation (Line(points={{10,-30},{20,-30},{20,-24}}, color={0,0,255}));
  connect(r_xy.n, opAmp_x.in_n)
    annotation (Line(points={{40,-24},{50,-24}}, color={0,0,255}));
  connect(opAmp_x.out, c_x.p)
    annotation (Line(points={{70,-30},{70,-10}}, color={0,0,255}));
  connect(opAmp_x.in_n, c_x.n)
    annotation (Line(points={{50,-24},{50,-10}}, color={0,0,255}));
  connect(r_1.n, opAmp_y.in_n)
    annotation (Line(points={{-10,36},{-20,36}}, color={0,0,255}));
  connect(c_y.p, r_1.p)
    annotation (Line(points={{10,-10},{10,36}}, color={0,0,255}));
  connect(opAmp_y.out, r_2.p)
    annotation (Line(points={{-40,30},{-40,50}}, color={0,0,255}));
  connect(opAmp_y.in_n, r_2.n)
    annotation (Line(points={{-20,36},{-20,50}}, color={0,0,255}));
  connect(opAmp_y.in_p, ground.p)
    annotation (Line(points={{-20,24},{-20,10}}, color={0,0,255}));
  connect(opAmp_invy.in_p, ground_xyz.p)
    annotation (Line(points={{-10,-36},{-10,-50},{0,-50}}, color={0,0,255}));
  connect(ground_xyz.p, opAmp_x.in_p)
    annotation (Line(points={{0,-50},{50,-50},{50,-36}}, color={0,0,255}));
  connect(ground_xyz.p, opAmp_z.in_p)
    annotation (Line(points={{0,-50},{-70,-50},{-70,-36}}, color={0,0,255}));
  connect(opAmp_y.out, diode.p)
    annotation (Line(points={{-40,30},{-50,30}}, color={0,0,255}));
  connect(r_zz.n, diode.n)
    annotation (Line(points={{-70,10},{-70,30}}, color={0,0,255}));
  connect(c_x.p, r_zx.p)
    annotation (Line(points={{70,-10},{70,70},{10,70}}, color={0,0,255}));
  connect(r_zx.n, diode.n)
    annotation (Line(points={{-10,70},{-70,70},{-70,30}}, color={0,0,255}));
  annotation (experiment(
      StopTime=1,
      Interval=1e-5,
      Tolerance=1e-06), Documentation(info="<html>
<p>See documentation of the enclosing subpackage.</p>
</html>"));
end ImprovedCircuit;
