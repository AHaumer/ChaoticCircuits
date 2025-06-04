within ChaoticCircuits.Components;
model NegCCMemristor "Charge-controlled Memristor with partly negative resistance"
  extends ChaoticCircuits.BaseModels.ChargeControlledMemristor(q(start=0.1));
  parameter SI.Resistance R0=1.5 "Parameter beta";
  parameter SI.Current I0=0.6 "Parameter alpha";
  parameter SI.Time Tau=1 "Time constant of internal state";
  Real x(min=0, max=1, start=0.1)=q/unitCharge "Dimensionless internal state";
protected
  parameter SI.ElectricCharge unitCharge=1;
equation
  Rmem = R0*(x^2 - 1);
  Tau*der(x) = i/I0 - x - x*i/I0;
  annotation (defaultComponentName="memristor",
    Icon(graphics={
        Line(points={{-34,-31},{-43,-14},{-51,6},{-60,30}}, color={0,0,0},
          smooth=Smooth.Bezier),
        Line(
          points={{0,-60},{-9,-58},{-17,-53},{-26,-43},{-34,-31}},
          color={238,46,47},
          smooth=Smooth.Bezier),
        Line(
          points={{0,-60},{9,-58},{17,-53},{26,-43},{34,-31}},
          color={238,46,47},
          smooth=Smooth.Bezier),
        Line(points={{34,-31},{43,-14},{51,6},{60,30}},     color={0,0,0},
          smooth=Smooth.Bezier)}),                       Documentation(info="<html>
<p>
This memristor model was suggested by <a href=\"modelica://ChaoticCircuits.UsersGuide.References\"> [Muthuswamy2010] </a> 
to construct the &quot;Simplest Chaotic Circuit&quot; (a series resonance circuit with nonlinear resistor = memristor).
</p>
</html>"));
end NegCCMemristor;
