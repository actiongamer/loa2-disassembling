package game.ui.familyBosses.render
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class FamilyBossTimeRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="84" height="47" buttonMode="true">
			  <Image skin="png.uiFamilyBosses.底框-暗" x="0" y="-1" var="img_bg"/>
			  <Image skin="png.uiFamilyBosses.底框-亮" var="img_selected"/>
			  <Image skin="png.a5.commonImgs.勾选框-对勾" x="58" y="20" var="img_ok"/>
			  <Label text="11月18日" autoSize="none" y="5" style="普通说明" width="84" height="20" align="center" centerX="0" x="0" var="txt_day" mouseEnabled="false" mouseChildren="false"/>
			  <Label text="16:00" autoSize="none" x="6" y="25" style="普通说明" width="72" height="20" align="center" centerX="0" var="txt_time" mouseEnabled="false" mouseChildren="false"/>
			</View>;
       
      
      public var img_bg:Image = null;
      
      public var img_selected:Image = null;
      
      public var img_ok:Image = null;
      
      public var txt_day:Label = null;
      
      public var txt_time:Label = null;
      
      public function FamilyBossTimeRenderUI()
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
