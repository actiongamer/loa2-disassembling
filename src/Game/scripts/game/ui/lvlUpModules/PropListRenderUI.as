package game.ui.lvlUpModules
{
   import morn.core.components.View;
   import morn.core.components.Label;
   
   public class PropListRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="337" height="33">
			  <Image skin="png.uiLvlUpModule.底" x="1" y="0"/>
			  <Label text="主角等级：" autoSize="none" x="61" y="8" style="普通说明" var="txt_name" language="en" lgx="36,61" lgy="8,8"/>
			  <Label text="27" autoSize="none" x="129" y="9" style="普通说明" var="txt_oldValue"/>
			  <Image skin="png.uiLvlUpModule.箭头" x="175" y="3"/>
			  <Label text="271" autoSize="left" x="242" y="9" style="重要提示绿" height="18" var="txt_newValue"/>
			</View>;
       
      
      public var txt_name:Label = null;
      
      public var txt_oldValue:Label = null;
      
      public var txt_newValue:Label = null;
      
      public function PropListRenderUI()
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
