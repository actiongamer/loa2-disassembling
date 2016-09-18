package game.ui.battlefield.BattlefieldIntroduce
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class BattlefieldIntroduceModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="449" height="465">
			  <PanelBgS3 x="2" y="1" width="449" height="465" showLightBottom="true" frameStyle="2" frameVisible="true"/>
			  <Image skin="png.a5.comps.img_block" x="21" y="42" width="412" height="213" autoSize="true" var="img_bg"/>
			  <Image skin="png.a5.commonImgs.img_yellow" x="254" y="72"/>
			  <Image skin="png.uiBattlefields.battlefieldTeamModule.img_introduceTitleBg" x="18" y="40"/>
			  <Image skin="png.uiBattlefields.battlefieldTeamModule.img_miniMapBg" x="14" y="69"/>
			  <Label autoSize="none" x="129" y="46" style="渐变1" width="193" align="center" height="19" text="水晶争夺战" var="txt_battlefieldName" size="15"/>
			  <Image skin="png.a5.comps.img_block" x="122" y="162" width="213" height="181" anchorX="0.5" anchorY="0.5" var="img_miniMap" autoSize="true"/>
			  <Label autoSize="none" x="231" y="95" style="普通说明" width="204" align="left" text="魔力水晶盛产于精灵之乡，是精灵们世世代代魔力的源泉。在整个大陆，各个联盟都对此垂涎三尺，虎视眈眈。可是由于精灵在此设置了结界，让其他人都无法进入此地。终于，战争的爆发打破了精灵设置的结界，一场围绕水晶的争夺战就此打响了。" var="txt_introduce" height="157" wordWrap="true" leading="0"/>
			  <Image skin="png.uiBattlefields.battlefieldIntroduceModule.img_introduceBg" x="14" y="247"/>
			  <Label autoSize="none" x="127" y="252" style="加底标题" width="193" align="center" text="\l50500017"/>
			  <Label autoSize="none" x="67" y="277" style="普通说明" width="366" align="left" var="txt_openLv" height="20" wordWrap="true" leading="1" text="\l50500019"/>
			  <Image skin="png.a5.commonImgs.img_dot" x="48" y="281"/>
			  <Image skin="png.a5.commonImgs.img_dot" x="48" y="300"/>
			  <Image skin="png.a5.commonImgs.img_dot" x="48" y="321"/>
			  <Image skin="png.a5.commonImgs.img_dot" x="48" y="340"/>
			  <Image skin="png.a5.commonImgs.img_dot" x="48" y="360"/>
			  <Image skin="png.a5.commonImgs.img_dot" x="48" y="381"/>
			  <Label autoSize="none" x="67" y="297" style="普通说明" width="366" align="left" var="txt_openTime" height="20" wordWrap="true" leading="1" text="开放时间"/>
			  <Label autoSize="none" x="67" y="317" style="普通说明" width="366" align="left" var="txt_playerNums" height="20" wordWrap="true" leading="1" text="参与人数"/>
			  <Label autoSize="none" x="67" y="337" style="普通说明" width="366" align="left" var="txt_playTime" height="20" wordWrap="true" leading="1" text="持续时间"/>
			  <Label autoSize="none" x="67" y="357" style="普通说明" width="366" align="left" var="txt_winCondition" height="20" wordWrap="true" leading="1" text="胜利条件"/>
			  <Label autoSize="none" x="67" y="377" style="普通说明" width="342" align="left" height="63" wordWrap="true" leading="1" text="\l50500024"/>
			  <Label autoSize="none" x="235" y="77" style="加底标题" width="193" align="center" text="\l50500016"/>
			</PopModuleView>;
       
      
      public var img_bg:Image = null;
      
      public var txt_battlefieldName:Label = null;
      
      public var img_miniMap:Image = null;
      
      public var txt_introduce:Label = null;
      
      public var txt_openLv:Label = null;
      
      public var txt_openTime:Label = null;
      
      public var txt_playerNums:Label = null;
      
      public var txt_playTime:Label = null;
      
      public var txt_winCondition:Label = null;
      
      public function BattlefieldIntroduceModuleUI()
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
