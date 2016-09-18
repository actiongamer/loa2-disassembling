package game.ui.newYears.day38s
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   import morn.core.components.Button;
   import morn.core.components.Box;
   import morn.core.components.Label;
   
   public class Day38ModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="800" height="550">
			  <Day38_VotePanel x="0" y="32" var="votePanelUI" runtime="game.ui.newYears.day38s.Day38_VotePanelUI"/>
			  <Image skin="png.a5.comps.img_block" x="-4" y="61" width="800" height="490" var="img_detail"/>
			  <Button stateNum="1" buttonMode="true" labelColors="0xd1cdbf,0xe1dfd6,0xada99b" labelSize="15" labelFont="SSZH" letterSpacing="2" skin="png.a5.btns.btn_closeS1" y="0" x="786" var="btn_close"/>
			  <Box x="0" y="170" var="box_detail_tip">
			    <Image skin="png.a5.commonImgs.img_alertBgS2" var="img_detail_tip" x="-2" y="2"/>
			    <Label text="当前放鞭炮点数" autoSize="none" x="50" y="97" style="普通说明" width="196" height="27" var="txt_detail_tip" size="14" multiline="true" wordWrap="true" align="center"/>
			  </Box>
			</PopModuleView>;
       
      
      public var votePanelUI:game.ui.newYears.day38s.Day38_VotePanelUI = null;
      
      public var img_detail:Image = null;
      
      public var btn_close:Button = null;
      
      public var box_detail_tip:Box = null;
      
      public var img_detail_tip:Image = null;
      
      public var txt_detail_tip:Label = null;
      
      public function Day38ModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.newYears.day38s.Day38_VotePanelUI"] = game.ui.newYears.day38s.Day38_VotePanelUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
