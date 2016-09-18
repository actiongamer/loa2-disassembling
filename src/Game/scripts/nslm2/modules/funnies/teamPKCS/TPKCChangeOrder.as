package nslm2.modules.funnies.teamPKCS
{
   import game.ui.teamPKCS.TPKCChangeOrderUI;
   import proto.CteamArenaInfoRes;
   import proto.CTeamMemberInfo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.core.components.View;
   import morn.customs.components.PlayerRender;
   import com.mz.core.mgrs.ObserverMgr;
   import proto.CteamArenaChangeSortReq;
   import nslm2.nets.sockets.ServerEngine;
   import nslm2.common.vo.PlayerVo;
   import flash.events.MouseEvent;
   import flash.display.BitmapData;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.geom.Point;
   import com.mz.core.configs.EnvConfig;
   import flash.events.Event;
   import flash.display.DisplayObject;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.utils.Uint64Util;
   import nslm2.utils.PlayerVoUtils;
   
   public class TPKCChangeOrder extends TPKCChangeOrderUI
   {
       
      
      private var preInfo:CteamArenaInfoRes;
      
      private var _selfArr:Array;
      
      private var hasChg:Boolean = false;
      
      private var dragger:View;
      
      private var _dragImage:Sprite;
      
      public function TPKCChangeOrder()
      {
         super();
         this.img_bg.skin = UrlLib.tpkcUrl("img_bg.jpg");
         this.txt_tips.text = LocaleMgr.ins.getStr(50800043);
         preInfo = TPKCModel.ins.preInfo;
         if(preInfo)
         {
            this.txt_left.text = preInfo.our.name;
            this.txt_right.text = preInfo.enemy.name;
            this.zl_left.txt_fightValue.value = Uint64Util.toNumber(preInfo.our.ability);
            this.zl_right.txt_fightValue.value = Uint64Util.toNumber(preInfo.enemy.ability);
            setSelfFace(PlayerVoUtils.playerBaseInfoArrToVoArr(cteamMemberToBaseInfoArr(preInfo.our.member)));
            setEnemyFace(PlayerVoUtils.playerBaseInfoArrToVoArr(cteamMemberToBaseInfoArr(preInfo.enemy.member)));
            updateArrow();
         }
      }
      
      private function cteamMemberToBaseInfoArr(param1:Array) : Array
      {
         var _loc3_:int = 0;
         var _loc2_:Array = [];
         _loc3_ = 0;
         while(_loc3_ < param1.length)
         {
            _loc2_.push(CTeamMemberInfo(param1[_loc3_]).info);
            _loc3_++;
         }
         return _loc2_;
      }
      
      public function setSelfFace(param1:Array) : void
      {
         var _loc2_:int = 0;
         _selfArr = [];
         _loc2_ = 0;
         while(_loc2_ < param1.length)
         {
            if(_loc2_ < 5)
            {
               _selfArr.push(param1[_loc2_]);
               setDate(this["s" + _loc2_],param1[_loc2_]);
               this["s" + _loc2_].addEventListener("mouseDown",onMouseDown);
               this["s" + _loc2_].mouseChildren = false;
               this["s" + _loc2_].txt_order.text = LocaleMgr.ins.getStr(50800044,[_loc2_ + 1]);
               _loc2_++;
               continue;
            }
            break;
         }
      }
      
      public function setEnemyFace(param1:Array) : void
      {
         var _loc2_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < param1.length)
         {
            if(_loc2_ < 5)
            {
               setDate(this["e" + _loc2_],param1[_loc2_]);
               this["e" + _loc2_].txt_order.text = LocaleMgr.ins.getStr(50800044,[_loc2_ + 1]);
               _loc2_++;
               continue;
            }
            break;
         }
      }
      
      private function setDate(param1:View, param2:*) : void
      {
         PlayerRender(param1).dataSource = param2;
      }
      
      override public function dispose() : void
      {
         var _loc1_:int = 0;
         if(hasChg)
         {
            ObserverMgr.ins.sendNotice("OPT_TPKC_CHANGE_ORDER_CLOSE");
         }
         if(_selfArr)
         {
            _loc1_ = 0;
            while(_loc1_ < _selfArr.length)
            {
               this["s" + _loc1_].removeEventListener("mouseDown",onMouseDown);
               _loc1_++;
            }
         }
         super.dispose();
      }
      
      private function onDrop(param1:View) : void
      {
         dropper = param1;
         onChgCpl = function():void
         {
            hasChg = true;
            var _loc1_:Object = dropper.dataSource;
            setDate(dropper,dragger.dataSource);
            setDate(dragger,_loc1_);
            updateArrow();
         };
         onErr = function():void
         {
         };
         if(dropper)
         {
            var fromIndex:int = dropper.xmlVar.split("s")[1];
            var toIndex:int = dragger.xmlVar.split("s")[1];
            var req:CteamArenaChangeSortReq = new CteamArenaChangeSortReq();
            req.from = fromIndex;
            req.__to = toIndex;
            ServerEngine.ins.send(5407,req,onChgCpl,onErr);
         }
      }
      
      private function updateArrow() : void
      {
         var _loc3_:int = 0;
         var _loc2_:Number = NaN;
         var _loc1_:Number = NaN;
         _loc3_ = 0;
         while(_loc3_ < 5)
         {
            _loc2_ = PlayerVo(this["s" + _loc3_].dataSource).fightValue;
            _loc1_ = PlayerVo(this["e" + _loc3_].dataSource).fightValue;
            if(_loc2_ >= _loc1_)
            {
               this["s" + _loc3_].img_arrow.skin = "png.uiTeamPKCS.img_a_green";
            }
            else
            {
               this["s" + _loc3_].img_arrow.skin = "png.uiTeamPKCS.img_a_red";
            }
            _loc3_++;
         }
      }
      
      private function onMouseDown(param1:MouseEvent) : void
      {
         dragger = param1.currentTarget as View;
         var _loc4_:BitmapData = new BitmapData(dragger.width,dragger.height,true,16777215);
         _loc4_.draw(dragger);
         var _loc3_:Bitmap = new Bitmap(_loc4_);
         var _loc2_:Sprite = new Sprite();
         _loc2_.addChild(_loc3_);
         _loc2_.alpha = 0.7;
         doDrag(_loc2_,dragger.dataSource,new Point(param1.localX,param1.localY));
      }
      
      public function doDrag(param1:Sprite = null, param2:* = null, param3:Point = null) : void
      {
         var _loc4_:* = null;
         _dragImage = param1;
         if(_dragImage)
         {
            if(!_dragImage.parent)
            {
               App.stage.addChild(_dragImage);
            }
            param3 = param3 || new Point();
            _loc4_ = _dragImage.globalToLocal(new Point(App.stage.mouseX,App.stage.mouseY));
            _dragImage.x = _loc4_.x - param3.x;
            _dragImage.y = _loc4_.y - param3.y;
            _dragImage.visible = false;
         }
         App.stage.addEventListener("mouseMove",onStageMouseMove);
         App.stage.addEventListener("mouseUp",onStageMouseUp);
      }
      
      private function onStageMouseMove(param1:MouseEvent) : void
      {
         if(!_dragImage.visible)
         {
            _dragImage.visible = true;
            _dragImage.startDrag();
         }
         if(param1.stageX <= 0 || param1.stageX >= App.stage.stageWidth || param1.stageY <= 0 || param1.stageY >= App.stage.stageHeight - EnvConfig.ins.shellY)
         {
            _dragImage.stopDrag();
         }
         else
         {
            _dragImage.startDrag();
         }
      }
      
      private function onStageMouseUp(param1:Event) : void
      {
         App.stage.removeEventListener("mouseMove",onStageMouseMove);
         App.stage.removeEventListener("mouseUp",onStageMouseUp);
         _dragImage.stopDrag();
         var _loc2_:DisplayObject = getDropTarget();
         if(_loc2_)
         {
            onDrop(_loc2_ as View);
         }
         if(_dragImage && _dragImage.parent)
         {
            _dragImage.parent.removeChild(_dragImage);
         }
         _dragImage = null;
      }
      
      private function getDropTarget() : DisplayObject
      {
         var _loc2_:int = 0;
         var _loc1_:* = null;
         _loc2_ = 0;
         while(_loc2_ < _selfArr.length)
         {
            if(_loc2_ < 5)
            {
               _loc1_ = View(this["s" + _loc2_]);
               if(_loc1_.hitTestPoint(App.stage.mouseX,App.stage.mouseY))
               {
                  return _loc1_;
               }
            }
            _loc2_++;
         }
         return null;
      }
   }
}
