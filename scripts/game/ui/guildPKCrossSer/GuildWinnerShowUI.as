package game.ui.guildPKCrossSer
{
   import morn.customs.components.PopModuleView;
   import game.ui.commons.comps.pageBars.PageBarS4UI;
   import morn.core.components.Label;
   import morn.core.components.Button;
   
   public class GuildWinnerShowUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="1158" height="656">
			  <PageBarS4 x="378" y="157" var="pageBarUI" runtime="game.ui.commons.comps.pageBars.PageBarS4UI"/>
			  <Label autoSize="none" x="485" y="168" style="二级框标题" width="192" height="49" align="center" var="txt_time" multiline="false"/>
			  <Button stateNum="1" buttonMode="true" labelColors="0xd1cdbf,0xe1dfd6,0xada99b" labelSize="15" labelFont="SSZH" letterSpacing="2" skin="png.a5.btns.btn_closeS1" y="99" x="996" var="btn_close"/>
			  <Label text="\l30610230 " autoSize="none" x="244" y="354" style="渐变1" width="666" height="22" align="center" var="txt_noData"/>
			  <Label autoSize="none" x="621" y="191" style="普通说明" width="115" height="20" var="txt_date" align="right"/>
			  <Label text="\l999900121" autoSize="none" x="341" y="66" style="渐变1" width="486" height="47" align="center" size="40" bold="true" mouseChildren="false" mouseEnabled="false"/>
			  <Label autoSize="none" x="334" y="138" style="重要提示黄" width="486" height="33" align="center" var="titleTxt" size="25" mouseChildren="false" mouseEnabled="false"/>
			</PopModuleView>;
       
      
      public var pageBarUI:PageBarS4UI = null;
      
      public var txt_time:Label = null;
      
      public var btn_close:Button = null;
      
      public var txt_noData:Label = null;
      
      public var txt_date:Label = null;
      
      public var titleTxt:Label = null;
      
      public function GuildWinnerShowUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS4UI"] = PageBarS4UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
