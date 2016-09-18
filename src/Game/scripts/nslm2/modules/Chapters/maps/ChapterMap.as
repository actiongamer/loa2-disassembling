package nslm2.modules.Chapters.maps
{
   import game.ui.chapters.ChapterMapUI;
   import com.mz.core.mediators.DragMediator;
   import com.mz.core.mediators.ClickMediator;
   import morn.core.components.Component;
   import nslm2.modules.Chapters.DungeonMapModule;
   import nslm2.modules.Chapters.ChapterModuleInitVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import com.mz.core.utils.DisplayUtils;
   import flash.geom.Point;
   import com.greensock.TweenLite;
   import flash.events.MouseEvent;
   import flash.events.Event;
   import com.mz.core.utils.MathUtil;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.foundations.mainToolBar.MainToolBarBackMsg;
   import nslm2.modules.Chapters.ChapterModel;
   import nslm2.mgrs.stcMgrs.vos.StcChapterVo;
   import flash.ui.Mouse;
   import morn.core.components.Image;
   import morn.core.utils.ColorUtil;
   import morn.customs.FilterLib;
   import com.mz.core.mgrs.UIMgr;
   
   public class ChapterMap extends ChapterMapUI
   {
       
      
      public var subMapArr:Array;
      
      private var _chapterIds:Array;
      
      private var dragMediator:DragMediator;
      
      private var clickMediatr:ClickMediator;
      
      private var curOverImage:Component;
      
      private var _dungeonMapPanel:DungeonMapModule;
      
      private var _initVo:ChapterModuleInitVo;
      
      private var isZoomIn:Boolean = false;
      
      private var boxMapOld:Point;
      
      public function ChapterMap()
      {
         var _loc3_:int = 0;
         var _loc1_:* = null;
         subMapArr = [];
         _chapterIds = [100,200];
         boxMapOld = new Point();
         super();
         var _loc2_:int = 2147483647;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            if(this.hasOwnProperty("img_map" + (_loc3_ + 1)))
            {
               _loc1_ = this["img_map" + (_loc3_ + 1)];
               subMapArr.push(_loc1_);
               _loc3_++;
               continue;
            }
            break;
         }
         this.visibleRect.fillAlpha = 0;
         this.addEventListener("mouseMove",onMouseMove);
         dragMediator = new DragMediator(this,UIMgr.root);
         dragMediator.addEventListener("valueChange",drag_update);
         clickMediatr = new ClickMediator(this,map_click);
      }
      
      public function get arrow() : MapArrow
      {
         return this.mapArrow as MapArrow;
      }
      
      public function show(param1:ChapterModuleInitVo = null) : void
      {
         var _loc2_:int = 0;
         arrow.mouseEnabled = false;
         this.arrowFadeIn();
         if(param1 != null)
         {
            _initVo = param1 as ChapterModuleInitVo;
            if(_initVo.chapterId)
            {
               _loc2_ = _initVo.chapterId;
            }
            else
            {
               _loc2_ = StcMgr.ins.getStageVo(_initVo.stageId).chapter_id;
            }
            this.curOverImage = subMapArr[_chapterIds.indexOf(_loc2_)];
            map_click();
         }
      }
      
      public function arrowFadeIn() : void
      {
         var _loc1_:Point = DisplayUtils.localToTarget(this.img_map1,this,new Point(img_map1.width / 2,img_map1.height / 2));
         this.arrow.x = _loc1_.x;
         this.arrow.y = _loc1_.y;
         this.arrow.alpha = 1;
         TweenLite.from(this.arrow,0.3,{
            "alpha":0,
            "x":this.arrow.x,
            "y":this.arrow.y - 60
         });
      }
      
      public function arrowFadeOut() : void
      {
         TweenLite.to(this.arrow,0.3,{
            "alpha":0,
            "x":this.arrow.x,
            "y":this.arrow.y - 60
         });
      }
      
      private function onMouseMove(param1:MouseEvent) : void
      {
         if(isZoomIn)
         {
            return;
         }
         var _loc2_:Component = this.checkMouse();
         if(curOverImage != null)
         {
            if(curOverImage != _loc2_)
            {
               curOverImage.filters = null;
               curOverImage = null;
               onOver(_loc2_);
            }
         }
         else
         {
            onOver(_loc2_);
         }
      }
      
      public function validateFilter() : void
      {
      }
      
      private function drag_update(param1:Event) : void
      {
         if(this.isZoomIn == false)
         {
            this.box_map.x = this.box_map.x + (this.dragMediator.thisMouseX - this.dragMediator.lastMouseX);
            this.box_map.y = this.box_map.y + (this.dragMediator.thisMouseY - this.dragMediator.lastMouseY);
            this.validateBoxMapXY();
         }
      }
      
      private function validateBoxMapXY() : void
      {
         this.box_map.x = MathUtil.maxMin(this.box_map.x,0,this.width - this.box_map.displayWidth);
         this.box_map.y = MathUtil.maxMin(this.box_map.y,0,this.height - this.box_map.displayHeight);
      }
      
      private function map_click() : void
      {
         var _loc1_:* = null;
         if(_dungeonMapPanel)
         {
            return;
         }
         if(isZoomIn == false)
         {
            if(this.curOverImage)
            {
               ObserverMgr.ins.sendNotice("main_tool_bar_back_add",new MainToolBarBackMsg(40400,this.back,null));
               isZoomIn = true;
               _loc1_ = ChapterModel.ins.stcChapterVoArr[this.subMapArr.indexOf(this.curOverImage)];
               _dungeonMapPanel = new DungeonMapModule();
               if(_initVo)
               {
                  _dungeonMapPanel.show(_initVo);
               }
               else
               {
                  _dungeonMapPanel.show(new ChapterModuleInitVo(_loc1_.id));
               }
               this.visible = false;
               this.parent.addChild(_dungeonMapPanel);
               curOverImage.filters = null;
               curOverImage = null;
               Mouse.cursor = "arrow";
               arrowFadeOut();
            }
         }
         else
         {
            ObserverMgr.ins.sendNotice("main_tool_bar_back_delete",new MainToolBarBackMsg(40400,this.back,null));
            arrowFadeIn();
            if(_dungeonMapPanel)
            {
               this.visible = true;
               _dungeonMapPanel.dispose();
            }
            isZoomIn = false;
         }
      }
      
      private function back() : void
      {
         ObserverMgr.ins.sendNotice("main_tool_bar_back_delete",new MainToolBarBackMsg(40400,this.map_click,null));
         arrowFadeIn();
         if(_dungeonMapPanel)
         {
            this.visible = true;
            _dungeonMapPanel.dispose();
            _dungeonMapPanel = null;
         }
         isZoomIn = false;
      }
      
      private function checkMouse() : Image
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc1_:* = 0;
         var _loc3_:int = subMapArr.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = subMapArr[_loc4_];
            _loc1_ = uint(_loc2_.bitmapData.getPixel32(_loc2_.mouseX,_loc2_.mouseY));
            if(ColorUtil.getAlpha(_loc1_) > 0)
            {
               return _loc2_;
            }
            _loc4_++;
         }
         return null;
      }
      
      private function onOver(param1:Component) : void
      {
         if(param1)
         {
            this.curOverImage = param1;
            param1.filters = FilterLib.ins.getFilterArr(301);
            Mouse.cursor = "hand";
         }
         else
         {
            Mouse.cursor = "arrow";
         }
      }
      
      override protected function resetPosition() : void
      {
         super.resetPosition();
         validateBoxMapXY();
      }
      
      override public function dispose() : void
      {
         dragMediator.dispose();
         this.clickMediatr.dispose();
         super.dispose();
      }
   }
}
