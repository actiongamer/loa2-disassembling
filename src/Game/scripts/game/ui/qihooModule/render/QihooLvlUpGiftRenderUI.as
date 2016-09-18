package game.ui.qihooModule.render
{
   import morn.core.components.View;
   import morn.core.components.List;
   import morn.core.components.Box;
   import morn.customs.components.ClipList;
   import morn.core.components.Button;
   import game.ui.commons.icons.WealthRenderS9UI;
   
   public class QihooLvlUpGiftRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="568" height="125">
			  <List x="128" y="35" repeatX="4" spaceX="20" var="list_gift">
			    <WealthRenderS9 name="render" runtime="game.ui.commons.icons.WealthRenderS9UI"/>
			  </List>
			  <Label text="恭喜您升级了，你将获得以下奖励" autoSize="none" x="158" y="3" style="渐变橙" size="14" width="260" height="24" align="center"/>
			  <Image skin="png.uiQihoo.左花纹" x="73" y="5"/>
			  <Image skin="png.uiQihoo.右花纹" x="419" y="5"/>
			  <Image skin="png.uiQihoo.分割线" x="-7" y="112"/>
			  <Box x="19" y="48" var="box_share">
			    <Image skin="png.uiQihoo.分享礼包" y="22"/>
			    <Image skin="png.uiQihoo.360卫士1" x="11"/>
			  </Box>
			  <Box x="30" y="37" var="box_level" width="84" height="55">
			    <Image skin="png.uiQihoo.360卫士1"/>
			    <Image skin="png.uiQihoo.级礼包" x="11" y="28"/>
			    <ClipList value="15" clipWidth="13" align="right" url="png.a5.comps.clipList.clipList_S24" x="9" y="29" width="40" height="22" var="clip_level"/>
			  </Box>
			  <Button label="按钮" x="442" y="52" style="按钮中绿" var="btn_get"/>
			</View>;
       
      
      public var list_gift:List = null;
      
      public var box_share:Box = null;
      
      public var box_level:Box = null;
      
      public var clip_level:ClipList = null;
      
      public var btn_get:Button = null;
      
      public function QihooLvlUpGiftRenderUI()
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
