package game.ui.TencentModule.render
{
   import morn.core.components.View;
   import morn.core.components.List;
   import morn.core.components.Image;
   import morn.customs.components.ClipList;
   import game.ui.commons.icons.WealthRenderS9UI;
   
   public class TencentVipLvlUpGiftRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="568" height="138">
			  <List x="126" y="33" repeatX="4" spaceX="29" var="list_gift">
			    <WealthRenderS9 name="render" runtime="game.ui.commons.icons.WealthRenderS9UI"/>
			  </List>
			  <Label text="恭喜您升级了，你将获得以下奖励" autoSize="none" x="158" y="5" style="渐变橙" size="14" width="260" height="24" align="center"/>
			  <Image skin="png.uiTencent.lvlup.左花纹" x="73" y="5"/>
			  <Image skin="png.uiTencent.lvlup.右花纹" x="419" y="5"/>
			  <Image skin="png.uiTencent.lvlup.级礼包" x="46" y="56" var="clip_lv"/>
			  <Image skin="png.uiTencent.lvlup.分割线" x="-7" y="119"/>
			  <ClipList value="50" clipWidth="13" align="right" url="png.a5.comps.clipList.clipList_S24" x="40" y="57" var="clip_lvl"/>
			</View>;
       
      
      public var list_gift:List = null;
      
      public var clip_lv:Image = null;
      
      public var clip_lvl:ClipList = null;
      
      public function TencentVipLvlUpGiftRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.WealthRenderS9UI"] = WealthRenderS9UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
