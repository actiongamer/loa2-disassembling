package game.ui.peakSports.peakSportsIntroduce
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class PeakSportsIntroduceModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="449" height="465">
			  <PanelBgS3 x="2" y="1" width="449" height="551" showLightBottom="true" frameStyle="2" frameVisible="true"/>
			  <Image skin="png.a5.comps.img_block" x="21" y="42" width="412" height="213" autoSize="true" var="img_bg"/>
			  <Image skin="png.a5.commonImgs.img_yellow" x="254" y="72"/>
			  <Image skin="png.uiBattlefields.battlefieldTeamModule.img_introduceTitleBg" x="18" y="40"/>
			  <Image skin="png.uiBattlefields.battlefieldTeamModule.img_miniMapBg" x="14" y="69"/>
			  <Label autoSize="none" x="129" y="46" style="渐变1" width="193" align="center" height="19" text="\l999600100" var="txt_battlefieldName" size="15"/>
			  <Image skin="png.a5.comps.img_block" x="122" y="162" width="213" height="181" anchorX="0.5" anchorY="0.5" var="img_miniMap" autoSize="true"/>
			  <Label autoSize="none" x="231" y="95" style="普通说明" width="204" align="left" text="\l999600112" var="txt_introduce" height="157" wordWrap="true" leading="0"/>
			  <Image skin="png.uiBattlefields.battlefieldIntroduceModule.img_introduceBg" x="14" y="247"/>
			  <Label autoSize="none" x="127" y="252" style="加底标题" width="193" align="center" text="\l50500017"/>
			  <Label autoSize="none" x="25" y="272" style="普通说明" width="406" align="left" var="txt_openLv" height="265" wordWrap="true" leading="1" text="\l999600113" multiline="true" isHtml="true"/>
			  <Label autoSize="none" x="235" y="77" style="加底标题" width="193" align="center" text="\l50500016"/>
			</PopModuleView>;
       
      
      public var img_bg:Image = null;
      
      public var txt_battlefieldName:Label = null;
      
      public var img_miniMap:Image = null;
      
      public var txt_introduce:Label = null;
      
      public var txt_openLv:Label = null;
      
      public function PeakSportsIntroduceModuleUI()
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
