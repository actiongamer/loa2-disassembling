package game.ui.roleInfos.tupos
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.List;
   import game.ui.commons.props.RolePropBaseRenderS2UI;
   
   public class GodhoodRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="304" height="300">
			  <Image skin="png.uiRoleInfo.tupo.img_heroBg" x="40" y="47" width="224" height="88"/>
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_2" x="57" y="60" var="img_quality" sizeGrid="6,6,6,6" width="56" height="56"/>
			  <Image skin="png.comp.image" x="61" y="64" var="img_icon" width="48" height="48"/>
			  <Label text="999" stroke="0xffffff" mouseEnabled="false" var="txt_hasNum" width="119" align="left" x="169" y="160" backgroundColor="0xcfbeaf" style="普通说明" height="20" size="14"/>
			  <Label text="999" stroke="0xffffff" mouseEnabled="false" var="txt_needNum" width="122" align="left" x="169" y="180" backgroundColor="0xcfbeaf" style="普通说明" height="20" size="14"/>
			  <Label text="现有数量：" stroke="0xffffff" mouseEnabled="false" width="82" align="right" x="86" y="159" backgroundColor="0xcfbeaf" style="普通说明" height="20" size="14."/>
			  <Label text="需要数量：" stroke="0xffffff" mouseEnabled="false" width="80" align="right" x="88" y="179" backgroundColor="0xcfbeaf" style="普通说明" height="20" size="14"/>
			  <Label text="999" stroke="0xffffff" mouseEnabled="false" var="txt_name" width="172" align="left" x="129" y="71" backgroundColor="0xcfbeaf" style="普通说明" height="20"/>
			  <List x="129" y="91" var="list_prop">
			    <RolePropBaseRenderS2 name="render" runtime="game.ui.commons.props.RolePropBaseRenderS2UI"/>
			  </List>
			</WealthRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_hasNum:Label = null;
      
      public var txt_needNum:Label = null;
      
      public var txt_name:Label = null;
      
      public var list_prop:List = null;
      
      public function GodhoodRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.props.RolePropBaseRenderS2UI"] = RolePropBaseRenderS2UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
