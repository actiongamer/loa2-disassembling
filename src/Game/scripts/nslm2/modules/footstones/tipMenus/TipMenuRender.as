package nslm2.modules.footstones.tipMenus
{
   import game.ui.tipMenus.TipMenuRenderUI;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import com.greensock.TweenLite;
   import morn.customs.FilterLib;
   
   public class TipMenuRender extends TipMenuRenderUI
   {
       
      
      private var oriIconX:int;
      
      private var oriTxtX:int;
      
      public function TipMenuRender()
      {
         super();
         oriIconX = this.img_icon.x;
         oriTxtX = this.txt_content.x;
      }
      
      public function get vo() : TipMenuConfigVo
      {
         return this.dataSource as TipMenuConfigVo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(vo)
         {
            this.img_icon.skin = UrlLib.tipMenuIcon(vo.iconId);
            this.txt_content.text = vo.name;
            this.img_redPoint.visible = vo.showRedPoint;
         }
         else
         {
            img_redPoint.visible = false;
         }
      }
      
      override public function changeSelectState(param1:int) : void
      {
         super.changeSelectState(param1);
         switch(int(param1) - 1)
         {
            case 0:
               this.img_icon.filters = [];
               this.txt_content.color = 14328417;
               TweenLite.to(img_icon,0.2,{"x":oriIconX});
               TweenLite.to(txt_content,0.2,{"x":oriTxtX});
               break;
            case 1:
               this.img_icon.filters = [FilterLib.BUTTON_OVER_STATE];
               this.txt_content.color = 14210735;
               TweenLite.to(img_icon,0.2,{"x":oriIconX - 6});
               TweenLite.to(txt_content,0.2,{"x":oriTxtX - 3});
         }
      }
   }
}
