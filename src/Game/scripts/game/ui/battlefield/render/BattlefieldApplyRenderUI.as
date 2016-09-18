package game.ui.battlefield.render
{
   import morn.customs.components.PanelView;
   import morn.core.components.Button;
   import morn.core.components.Box;
   import morn.core.components.Label;
   
   public class BattlefieldApplyRenderUI extends PanelView
   {
      
      protected static var uiView:XML = <PanelView width="190" height="170">
			  <Button label="\l50500004" y="84" style="按钮大红" x="35.5" var="btn_singleApply"/>
			  <Button y="134" style="按钮大绿" x="35.5" var="btn_teamApply" label="\l50500064"/>
			  <Box x="-41" y="-3" var="box_inTeam">
			    <Button label="\l50500014" y="87" style="按钮大红" x="76.5" var="btn_cancel"/>
			    <Image skin="png.uiBattlefields.img_applyedBg" x="0" y="0"/>
			    <Label autoSize="none" x="52" y="43" style="渐变绿" align="center" bold="true" visible="true" width="168" height="34" var="txt_alert" text="20:30" size="25"/>
			    <Label text="队列中" autoSize="none" x="54" y="8" style="渐变1" width="164" height="29" align="center" size="23"/>
			  </Box>
			  <Box x="-157" y="-3" var="box_started">
			    <Button label="\l50500058" y="137" style="按钮大黄" x="192" var="btn_refuse"/>
			    <Image skin="png.uiBattlefields.img_applyedBg" x="116"/>
			    <Label autoSize="none" x="168" y="43" style="渐变绿" align="center" bold="true" visible="true" width="168" height="34" var="txt_applyAlert" text="20:30" size="25"/>
			    <Label text="\l50500052" autoSize="none" y="7" style="渐变1" width="499" height="27" align="center" size="23" wordWrap="true" var="txt_startInfo"/>
			    <Button label="\l50500057" y="87" style="按钮大绿" x="193" var="btn_apply"/>
			  </Box>
			</PanelView>;
       
      
      public var btn_singleApply:Button = null;
      
      public var btn_teamApply:Button = null;
      
      public var box_inTeam:Box = null;
      
      public var btn_cancel:Button = null;
      
      public var txt_alert:Label = null;
      
      public var box_started:Box = null;
      
      public var btn_refuse:Button = null;
      
      public var txt_applyAlert:Label = null;
      
      public var txt_startInfo:Label = null;
      
      public var btn_apply:Button = null;
      
      public function BattlefieldApplyRenderUI()
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
