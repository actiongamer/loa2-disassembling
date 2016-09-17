package game.ui.petModule.comps
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.List;
   import game.ui.commons.comps.others.PetPosBuffViewUI;
   import game.ui.roleInfos.equipPanels.BasePropRenderUI;
   
   public class PetStarPreViewListRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="230" height="301">
			  <Image skin="png.uiPet.bg3" y="26" x="7"/>
			  <Image skin="png.a5.commonImgs.img_yellow" x="32.5" y="30"/>
			  <Label text="\l32000009" autoSize="none" x="38" y="34" style="加底标题" width="142" height="18" align="center"/>
			  <Label text="2星" autoSize="none" x="38" style="普通绿色" width="142" height="18" align="center" var="txt_nextStar" y="3"/>
			  <List x="54" y="56" repeatY="5" var="list_nextProp">
			    <BasePropRender name="render" runtime="game.ui.roleInfos.equipPanels.BasePropRenderUI"/>
			  </List>
			  <Image skin="png.a5.commonImgs.img_yellow" x="32" y="160"/>
			  <Label text="\l32000011" autoSize="none" x="37.5" y="162" style="加底标题" width="143" height="18" align="center"/>
			  <PetPosBuffView y="186" var="posBuffViewNext" x="54" runtime="game.ui.commons.comps.others.PetPosBuffViewUI"/>
			  <Label text="\l32000021" autoSize="none" x="21" y="301" style="普通说明暗色深" width="189" height="18" align="left"/>
			</View>;
       
      
      public var txt_nextStar:Label = null;
      
      public var list_nextProp:List = null;
      
      public var posBuffViewNext:PetPosBuffViewUI = null;
      
      public function PetStarPreViewListRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.others.PetPosBuffViewUI"] = PetPosBuffViewUI;
         viewClassMap["game.ui.roleInfos.equipPanels.BasePropRenderUI"] = BasePropRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
