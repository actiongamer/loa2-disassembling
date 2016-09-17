package game.ui.heroCompare.render
{
   import morn.core.components.View;
   import morn.core.components.List;
   import morn.core.components.Label;
   
   public class HCDescRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="120" height="650">
			  <Image skin="png.uiHeroCompare.标题头" x="1" y="0"/>
			  <Image skin="png.uiHeroCompare.长条03" x="-1" y="30"/>
			  <Image skin="png.uiHeroCompare.长条04" x="-1" y="272"/>
			  <Image skin="png.uiHeroCompare.长条04" x="-1" y="303"/>
			  <Image skin="png.uiHeroCompare.长条04" x="-1" y="334"/>
			  <Image skin="png.uiHeroCompare.长条04" x="0" y="549"/>
			  <Image skin="png.uiHeroCompare.长条03" x="-1" y="365"/>
			  <Image skin="png.a5.commonImgs.img_yellow" x="-2" y="307" width="120" height="25"/>
			  <Image skin="png.uiHeroCompare.长条03" x="-1" y="457"/>
			  <Image skin="png.uiHeroCompare.长条04" x="0" y="580"/>
			  <Image skin="png.uiHeroCompare.长条04" x="0" y="611"/>
			  <Image skin="png.a5.commonImgs.img_yellow" x="0" y="274" width="120" height="25"/>
			  <Image skin="png.a5.commonImgs.img_yellow" x="2" y="366" width="120" height="25"/>
			  <Image skin="png.a5.commonImgs.img_yellow" x="1" y="338" width="120" height="25"/>
			  <Image skin="png.a5.commonImgs.img_yellow" x="3" y="458" width="120" height="25"/>
			  <Image skin="png.a5.commonImgs.img_yellow" x="1" y="612" width="120" height="25"/>
			  <List x="0" y="61" repeatY="7" var="listBaseInfo">
			    <HCHeroSubInfoRender name="render" runtime="game.ui.heroCompare.render.HCHeroSubInfoRenderUI"/>
			  </List>
			  <Image skin="png.a5.commonImgs.img_yellow" x="1" y="549" width="120" height="25"/>
			  <Image skin="png.a5.commonImgs.img_yellow" x="1" y="31" width="120" height="25"/>
			  <List x="0" y="396" repeatY="2" var="listEquipInfo">
			    <HCHeroSubInfoRender name="render" runtime="game.ui.heroCompare.render.HCHeroSubInfoRenderUI"/>
			  </List>
			  <Image skin="png.a5.commonImgs.img_yellow" x="2" y="582" width="120" height="25"/>
			  <Label autoSize="none" x="9" y="342" width="102" height="23" align="center" var="txt_yuanfen" text="123123123" bold="true" style="TAB暗"/>
			  <List x="0" y="488" repeatY="2" var="listBaowuInfo">
			    <HCHeroSubInfoRender name="render" runtime="game.ui.heroCompare.render.HCHeroSubInfoRenderUI"/>
			  </List>
			  <Label autoSize="left" x="13" y="616" width="102" height="23" align="center" var="txt_fashion" text="123123123" bold="true" style="TAB暗"/>
			  <Image skin="png.a5.commonImgs.img_yellow" x="11" y="2" width="120" height="25"/>
			  <Label autoSize="none" x="9" y="35" width="102" height="23" align="center" var="txt_base" text="12312312" bold="true" style="TAB暗"/>
			  <Label autoSize="none" x="-4" y="5" width="150" height="23" align="center" var="txt_title" text="123123123" bold="true" style="TAB暗"/>
			  <Label autoSize="none" x="10" y="278" width="102" height="23" align="center" var="txt_tupo" text="123123" bold="true" style="TAB暗"/>
			  <Label autoSize="none" x="11" y="310" width="102" height="23" align="center" var="txt_jieshu" text="123123" bold="true" style="TAB暗"/>
			  <Label autoSize="none" x="12" y="586" width="102" height="23" align="center" var="txt_horse" text="123123123" bold="true" style="TAB暗"/>
			  <Label autoSize="none" x="11" y="554" width="102" height="23" align="center" var="txt_militaryRank" text="123123123" bold="true" style="TAB暗"/>
			  <Label autoSize="none" x="10" y="461" width="102" height="23" align="center" var="txt_baowu" text="123123123" bold="true" style="TAB暗"/>
			  <Label autoSize="none" x="11" y="371" width="102" height="23" align="center" var="txt_equip" text="123123123" bold="true" style="TAB暗"/>
			</View>;
       
      
      public var listBaseInfo:List = null;
      
      public var listEquipInfo:List = null;
      
      public var txt_yuanfen:Label = null;
      
      public var listBaowuInfo:List = null;
      
      public var txt_fashion:Label = null;
      
      public var txt_base:Label = null;
      
      public var txt_title:Label = null;
      
      public var txt_tupo:Label = null;
      
      public var txt_jieshu:Label = null;
      
      public var txt_horse:Label = null;
      
      public var txt_militaryRank:Label = null;
      
      public var txt_baowu:Label = null;
      
      public var txt_equip:Label = null;
      
      public function HCDescRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.heroCompare.render.HCHeroSubInfoRenderUI"] = HCHeroSubInfoRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
