package game.ui.familyBosses.render
{
   import morn.core.components.View;
   import game.ui.commons.icons.WealthRender60X60UI;
   import morn.core.components.Label;
   
   public class HornorPlayerRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="255" height="93">
			  <Image skin="png.uiFamilyBossHornor.img2" x="0" y="1"/>
			  <WealthRender60X60 x="13" y="17" var="headRender" runtime="game.ui.commons.icons.WealthRender60X60UI"/>
			  <Label text="普通说明" autoSize="left" x="85" y="21" style="普通说明" var="txt_name"/>
			  <Label text="游族-封测福-是s1" autoSize="left" x="86" y="39" style="普通说明" var="txt_sname"/>
			  <Label text="输出：10000000" autoSize="left" x="85" y="57" style="普通说明" var="txt_dmg"/>
			</View>;
       
      
      public var headRender:WealthRender60X60UI = null;
      
      public var txt_name:Label = null;
      
      public var txt_sname:Label = null;
      
      public var txt_dmg:Label = null;
      
      public function HornorPlayerRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.WealthRender60X60UI"] = WealthRender60X60UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
