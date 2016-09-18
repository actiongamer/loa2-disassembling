package game.ui.firstChargeModule
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Button;
   import morn.core.components.List;
   import morn.core.components.Image;
   import game.ui.commons.icons.WealthRenderS9UI;
   
   public class FirstChargeViewUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="901" height="632">
			  <Button label="充值" skin="png.uiFirstCharge.img_charge" x="366" y="500" stateNum="1" labelSize="17" labelMargin="0,5,2,4" var="btn_charge"/>
			  <List x="237" y="404" repeatX="6" spaceX="11.5" var="list_reward">
			    <WealthRenderS9 name="render" runtime="game.ui.commons.icons.WealthRenderS9UI"/>
			  </List>
			  <Image skin="png.uiFirstCharge.img_light" x="652" y="494" rotation="90" width="491" height="517" alpha="0.3" scale="0.2" var="img_light" mouseChildren="false" mouseEnabled="false"/>
			  <Button skin="png.a5.btns.btn_closeS1" y="113" stateNum="1" var="btn_close" x="824"/>
			</PopModuleView>;
       
      
      public var btn_charge:Button = null;
      
      public var list_reward:List = null;
      
      public var img_light:Image = null;
      
      public var btn_close:Button = null;
      
      public function FirstChargeViewUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.WealthRenderS9UI"] = WealthRenderS9UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
