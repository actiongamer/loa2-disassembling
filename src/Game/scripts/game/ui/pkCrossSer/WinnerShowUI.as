package game.ui.pkCrossSer
{
   import morn.customs.components.PopModuleView;
   import game.ui.commons.comps.pageBars.PageBarS4UI;
   import morn.customs.components.ClipList;
   import morn.core.components.Label;
   import morn.core.components.Button;
   
   public class WinnerShowUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="1056" height="663">
			  <PageBarS4 x="329" y="138" var="pageBarUI" runtime="game.ui.commons.comps.pageBars.PageBarS4UI"/>
			  <Image skin="png.uiWinnerShow.img_di" x="457" y="137"/>
			  <ClipList value="123" clipWidth="31" align="center" url="png.uiWinnerShow.clipList_digital" x="531" y="138" var="img_jie" gapX="-10" lgy="138,138" lgx="575,531"/>
			  <Image skin="png.uiWinnerShow.img_jie" x="573" y="137" lgx="472,573" lgy="137,137"/>
			  <Label text="二级框标题" autoSize="none" x="436" y="171" style="二级框标题" width="192" height="20" align="center" var="txt_time"/>
			  <Button stateNum="1" buttonMode="true" labelColors="0xd1cdbf,0xe1dfd6,0xada99b" labelSize="15" labelFont="SSZH" letterSpacing="2" skin="png.a5.btns.btn_closeS1" y="89" x="956" var="btn_close"/>
			  <Label text="\l50600044" autoSize="none" x="295" y="344" style="渐变1" width="486" height="22" align="center" var="txt_noData"/>
			</PopModuleView>;
       
      
      public var pageBarUI:PageBarS4UI = null;
      
      public var img_jie:ClipList = null;
      
      public var txt_time:Label = null;
      
      public var btn_close:Button = null;
      
      public var txt_noData:Label = null;
      
      public function WinnerShowUI()
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
