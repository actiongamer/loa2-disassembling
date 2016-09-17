package game.ui.newYears.newYear2016s
{
   import morn.core.components.View;
   import morn.core.components.Button;
   import morn.core.components.Label;
   import morn.core.components.Image;
   import game.ui.commons.comps.others.RedPointUI;
   
   public class NewYear2016_BossPanelUI extends View
   {
      
      protected static var uiView:XML = <View width="518" height="489">
			  <Image skin="png.uiNewYear2016.subPanels.img_bg_boss" x="0" y="0"/>
			  <Image skin="png.uiNewYear2016.subPanels.boss_line" x="27" y="395"/>
			  <Button label="立即前往" x="207" style="按钮大绿" y="445" var="btn_get"/>
			  <Label text="每天打boss" autoSize="none" x="104" y="416" style="小标题" width="321" height="22" align="center" var="txt_tip2"/>
			  <Label text="大事不好" autoSize="none" x="19" y="14" style="渐变1" width="388" height="93" var="txt_tip1"/>
			  <Image skin="png.uiNewYear2016.subPanels.boss_icon_1" x="430" y="43" width="50" height="50" var="img_icon1"/>
			  <Image skin="png.uiNewYear2016.subPanels.boss_icon_2" x="430" y="140" width="50" height="50" var="img_icon2"/>
			  <Label text="渐变" autoSize="none" x="404" y="83" style="渐变1" width="104" height="22" align="center" var="txt_icon1"/>
			  <Label text="渐变" autoSize="none" x="404" y="179" style="渐变1" width="104" height="22" align="center" var="txt_icon2"/>
			  <RedPoint x="465" y="141" var="redPoi" runtime="game.ui.commons.comps.others.RedPointUI"/>
			</View>;
       
      
      public var btn_get:Button = null;
      
      public var txt_tip2:Label = null;
      
      public var txt_tip1:Label = null;
      
      public var img_icon1:Image = null;
      
      public var img_icon2:Image = null;
      
      public var txt_icon1:Label = null;
      
      public var txt_icon2:Label = null;
      
      public var redPoi:RedPointUI = null;
      
      public function NewYear2016_BossPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.others.RedPointUI"] = RedPointUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
