package game.ui.mainCitys
{
   import morn.core.components.View;
   import morn.core.components.Button;
   
   public class ResBgBtnEnterUI extends View
   {
      
      protected static var uiView:XML = <View width="189" height="104">
			  <Image skin="png.uiMainCitys.resDgSelectBosses.img_btn_redBg5" x="31" y="0"/>
			  <Image skin="png.uiMainCitys.resDgSelectBosses.img_btn_redBg4" x="0" y="36"/>
			  <Image skin="png.uiMainCitys.resDgSelectBosses.img_btn_redBg3" x="50" y="9"/>
			  <Image skin="png.uiMainCitys.resDgSelectBosses.img_btn_redBg2" x="34" y="27"/>
			  <Button label="" stateNum="1" buttonMode="true" skin="png.uiMainCitys.resDgSelectBosses.btn_red" x="50" y="40" var="btn_enter"/>
			  <Image skin="png.uiMainCitys.resDgSelectBosses.img_btn_redBg1" x="17" y="31"/>
			  <Image skin="png.uiMainCitys.resDgSelectBosses.img_btn_redBg6" x="138" y="47"/>
			  <Image skin="png.uiMainCitys.resDgSelectBosses.img_btn_redBg7" x="42" y="48"/>
			  <Button label="" stateNum="1" buttonMode="true" skin="png.uiMainCitys.resDgSelectBosses.btn_red_txt" x="72" y="44"/>
			</View>;
       
      
      public var btn_enter:Button = null;
      
      public function ResBgBtnEnterUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
         createView(uiView);
      }
   }
}
