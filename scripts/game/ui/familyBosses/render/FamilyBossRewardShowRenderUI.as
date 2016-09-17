package game.ui.familyBosses.render
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import game.ui.commons.icons.WealthRenderS56UI;
   import morn.core.components.Image;
   
   public class FamilyBossRewardShowRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="220" height="66">
			  <Label text="普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明" autoSize="left" x="68" y="17" style="普通说明" var="txt_condition" width="170" height="40" language="en" lgx="68,68" lgy="7,17" multiline="true" wordWrap="true"/>
			  <WealthRenderS56 x="6" y="5" var="rwdRender" runtime="game.ui.commons.icons.WealthRenderS56UI"/>
			  <Label text="\l40740062" autoSize="left" x="68" y="39" style="普通说明"/>
			  <Label text="进度：" autoSize="left" x="108" y="39" style="普通说明" height="20" var="txt_progress" language="en" lgy="39,39" lgx="140,108"/>
			  <Image skin="png.uiFamilyBosses.分割线2" x="-2.5" y="64"/>
			  <Image skin="png.uiFamilyBosses.已达成" x="197" y="33" var="img_got" anchorX=".5" anchorY=".5"/>
			  <Image skin="png.a5.commonImgs.img_gotReward" x="197" y="34" var="img_hasGot" anchorX=".5" anchorY=".5"/>
			</View>;
       
      
      public var txt_condition:Label = null;
      
      public var rwdRender:WealthRenderS56UI = null;
      
      public var txt_progress:Label = null;
      
      public var img_got:Image = null;
      
      public var img_hasGot:Image = null;
      
      public function FamilyBossRewardShowRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.WealthRenderS56UI"] = WealthRenderS56UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
