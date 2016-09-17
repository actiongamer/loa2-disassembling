package nslm2.modules.footstones.moduleBases
{
   import morn.core.components.Component;
   import com.mz.core.interFace.IObserver;
   import flash.display.BitmapData;
   import com.mz.core.mgrs.UIMgr;
   import flash.geom.Rectangle;
   import flash.geom.Point;
   import com.mz.core.mgrs.ObserverMgr;
   import morn.customs.FilterLib;
   
   public class FakeSceneLayer extends Component implements IObserver
   {
       
      
      private var bmd:BitmapData;
      
      private var open3DWindowCnt:int;
      
      private var holeRect:Rectangle;
      
      public function FakeSceneLayer()
      {
         super();
         ObserverMgr.ins.regObserver(this);
         this.filters = [FilterLib.sceneBlurFilter];
      }
      
      public function getFocusNotices() : Array
      {
         return ["MSG_FAKE_SCENE","MSG_POP_MODULE_HOLE","msg_show_fake_scene_layer"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc4_:* = null;
         var _loc3_:* = null;
         var _loc9_:* = param1;
         if("MSG_FAKE_SCENE" !== _loc9_)
         {
            if("MSG_POP_MODULE_HOLE" !== _loc9_)
            {
               if("msg_show_fake_scene_layer" === _loc9_)
               {
                  this.visible = param2;
                  ModuleMgr.ins.sceneLayer.visible = !param2;
               }
            }
            else if(this.bmd)
            {
               _loc4_ = param2 as Rectangle;
               if(_loc4_)
               {
                  _loc3_ = this.globalToLocal(new Point(_loc4_.x,_loc4_.y));
                  holeRect = new Rectangle(_loc3_.x,_loc3_.y,_loc4_.width,_loc4_.height);
               }
               else
               {
                  holeRect = null;
               }
               setBmd();
            }
         }
         else if(param2)
         {
            try
            {
               _loc5_ = new BitmapData(UIMgr.gameWidth,UIMgr.gameHeight,true,0);
               _loc5_.draw(ModuleMgr.ins.sceneLayer);
               _loc6_ = _loc5_.getColorBoundsRect(4278190080,0,false);
               if(!(_loc6_.width == 0 || _loc6_.height == 0))
               {
                  bmd = _loc5_;
                  setBmd();
               }
               open3DWindowCnt = Number(open3DWindowCnt) + 1;
               ModuleMgr.ins.sceneLayer.visible = false;
            }
            catch($err:Error)
            {
            }
         }
         else
         {
            open3DWindowCnt = Number(open3DWindowCnt) - 1;
            if(open3DWindowCnt <= 0)
            {
               bmd = null;
               holeRect = null;
               this.graphics.clear();
               ModuleMgr.ins.sceneLayer.visible = true;
            }
         }
      }
      
      private function setBmd() : void
      {
         this.graphics.clear();
         this.graphics.beginBitmapFill(bmd);
         this.graphics.drawRect(0,0,bmd.width,bmd.height);
         if(holeRect)
         {
            this.graphics.drawRect(holeRect.x,holeRect.y,holeRect.width,holeRect.height);
         }
         this.graphics.endFill();
      }
   }
}
