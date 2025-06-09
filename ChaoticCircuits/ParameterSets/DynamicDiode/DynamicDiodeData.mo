within ChaoticCircuits.ParameterSets.DynamicDiode;
record DynamicDiodeData "Parameters for Dynamic Diode model"
  extends Modelica.Icons.Record;
  import Modelica.Constants.inf;
  parameter String Type="Std";
  parameter SI.Current IFav=inf "Maximum average forward rectified current";
  parameter SI.Voltage VRrm=-inf "Maximum repetitive peak reverse voltage";
  parameter SI.Current Ids=1e-9 "Saturation current";
  parameter SI.Voltage nVt=1*25e-3 "n * voltage equivalent of temperature";
  parameter SI.Capacitance C0=0 "Junction capacitance at v=0";
  parameter SI.Voltage V0=1 "Voltage parameter for junction capacitance";
  parameter Real m=1 "Exponent parameter of junction capacitance";
  parameter Real fc(final min=0, final max=0.99)=0
    "Parameter of linear extrapolation of junction capacitance";
  parameter SI.Time TauT=0 "Transition time";
   annotation(defaultComponentPrefixes="parameter", Icon(graphics={Text(
          extent={{-100,-10},{100,-40}},
          textColor={28,108,200},
          textString="%Type")}));
end DynamicDiodeData;
