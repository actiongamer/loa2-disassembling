package game.ui.petModule
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Tab;
   import morn.core.components.Image;
   import game.ui.commons.comps.others.RedPointUI;
   import game.ui.petModule.comps.PetSelectPanelUI;
   import morn.core.components.Box;
   import morn.core.components.Label;
   
   public class PetModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="800" height="550">
			  <PanelBg width="804" height="551" showTabLine="false" x="1" y="1"/>
			  <Tab x="31" y="37" style="TAB超长" var="tabBar" selectedIndex="-1" labels="1,2,3,4,5,6"/>
			  <Image skin="png.uiPet.bg" x="20" y="63" var="img_bg"/>
			  <Image skin="png.a5.bgs.panelBgs.img_frameS1" x="18" y="61" sizeGrid="14,18,14,14" width="771" height="477" mouseEnabled="false" mouseChildren="false"/>
			  <Image skin="png.uiPet.leftBg" x="22" y="64"/>
			  <RedPoint x="225" y="35" var="redPoint1" runtime="game.ui.commons.comps.others.RedPointUI"/>
			  <RedPoint x="330" y="35" var="redPoint2" runtime="game.ui.commons.comps.others.RedPointUI"/>
			  <RedPoint x="540" y="35" var="redPoint3" runtime="game.ui.commons.comps.others.RedPointUI"/>
			  <RedPoint x="645" y="35" var="redPoint4" runtime="game.ui.commons.comps.others.RedPointUI"/>
			  <RedPoint x="119" y="35" var="redPoint0" runtime="game.ui.commons.comps.others.RedPointUI"/>
			  <PetSelectPanel x="28" y="82" var="petSelectPanel" runtime="game.ui.petModule.comps.PetSelectPanelUI"/>
			  <Box x="230" y="61" var="box_title">
			    <Image skin="png.uiPet.bg4"/>
			    <Label text="Lv.3" stroke="0xffffff" mouseEnabled="false" var="txt_level" backgroundColor="0xcfbeaf" autoSize="left" x="11" y="19" letterSpacing="1" width="64" height="18" align="right" style="普通说明"/>
			    <Label text="激活条件：" stroke="0xffffff" mouseEnabled="false" var="txt_name" backgroundColor="0xcfbeaf" autoSize="left" x="80" y="16" letterSpacing="1" width="141" height="25" align="left" style="二级框标题" size="14"/>
			    <Label text="激活条件：" stroke="0xffffff" mouseEnabled="false" var="txt_jinjie" backgroundColor="0xcfbeaf" autoSize="left" x="24" y="43" letterSpacing="1" width="159" height="18" align="center" style="普通说明"/>
			  </Box>
			</PopModuleView>;
       
      
      public var tabBar:Tab = null;
      
      public var img_bg:Image = null;
      
      public var redPoint1:RedPointUI = null;
      
      public var redPoint2:RedPointUI = null;
      
      public var redPoint3:RedPointUI = null;
      
      public var redPoint4:RedPointUI = null;
      
      public var redPoint0:RedPointUI = null;
      
      public var petSelectPanel:PetSelectPanelUI = null;
      
      public var box_title:Box = null;
      
      public var txt_level:Label = null;
      
      public var txt_name:Label = null;
      
      public var txt_jinjie:Label = null;
      
      public function PetModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.others.RedPointUI"] = RedPointUI;
         viewClassMap["game.ui.petModule.comps.PetSelectPanelUI"] = PetSelectPanelUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
