package game.ui.sevenDayModule.view
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import game.ui.commons.comps.others.RedPointNumUI;
   
   public class DayRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="200" height="68" mouseEnabled="false">
			  <Image skin="png.a5.comps.img_block" x="-2" y="-1" var="img_bg" width="203" height="71"/>
			  <Image skin="png.uiSevenDays.选中框01" name="selectBoxAll" x="-4" y="-4" buttonMode="true" width="207" height="77"/>
			  <Image skin="png.a5.commonImgs.btn_reward2" x="4" y="8" width="53" height="50" var="img_icon"/>
			  <Label text="普通说明" autoSize="left" x="57" y="35" style="普通说明" var="day_label" buttonMode="true" mouseChildren="false" width="134" height="20" align="left"/>
			  <Label text="开服第一天" autoSize="none" x="57" y="9" style="渐变1" width="133" height="22" align="left" var="text_title" buttonMode="true" mouseChildren="false"/>
			  <RedPointNum x="182" y="-3" var="red_point" runtime="game.ui.commons.comps.others.RedPointNumUI"/>
			</View>;
       
      
      public var img_bg:Image = null;
      
      public var img_icon:Image = null;
      
      public var day_label:Label = null;
      
      public var text_title:Label = null;
      
      public var red_point:RedPointNumUI = null;
      
      public function DayRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.others.RedPointNumUI"] = RedPointNumUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
