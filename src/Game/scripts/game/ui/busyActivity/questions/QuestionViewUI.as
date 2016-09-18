package game.ui.busyActivity.questions
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Box;
   import morn.core.components.Button;
   import game.ui.commons.comps.pageBars.PageBarS1UI;
   import morn.core.components.Label;
   
   public class QuestionViewUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="694" height="625">
			  <Image skin="png.uiQuestion.back" x="0" y="0"/>
			  <Box x="57" y="179" width="580" height="352" var="box"/>
			  <Button label="\l999903001" x="518" style="按钮大绿" y="566" var="btn_update"/>
			  <PageBarS1 x="303" y="571" var="pageBarUI" runtime="game.ui.commons.comps.pageBars.PageBarS1UI"/>
			  <Label text="二级框标题" autoSize="none" x="202" y="10" style="渐变_抽奖" width="272" height="43" align="center" var="txt_title"/>
			  <Label text="1\n2" autoSize="none" x="28" y="113" style="普通说明" width="635" height="40" multiline="true" wordWrap="true" var="txt_desc"/>
			  <Label text="time" autoSize="none" x="289" y="77" style="重要提示橘黄" width="374" height="20" multiline="false" wordWrap="false" var="txt_time" align="right"/>
			  <Button stateNum="1" buttonMode="true" labelColors="0xd1cdbf,0xe1dfd6,0xada99b" labelSize="15" labelFont="SSZH" letterSpacing="2" skin="png.a5.btns.btn_closeS1" y="29" x="623" var="btn_close"/>
			</PopModuleView>;
       
      
      public var box:Box = null;
      
      public var btn_update:Button = null;
      
      public var pageBarUI:PageBarS1UI = null;
      
      public var txt_title:Label = null;
      
      public var txt_desc:Label = null;
      
      public var txt_time:Label = null;
      
      public var btn_close:Button = null;
      
      public function QuestionViewUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS1UI"] = PageBarS1UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
