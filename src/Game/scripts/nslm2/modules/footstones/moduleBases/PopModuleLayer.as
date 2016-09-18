package nslm2.modules.footstones.moduleBases
{
   import com.mz.core.interFace.IObserver;
   import flash.display.Sprite;
   import flash.geom.Rectangle;
   import com.mz.core.configs.ClientConfig;
   import com.mz.core.logging.Log;
   import nslm2.common.globals.GlobalRef;
   import nslm2.modules.Chapters.ChapterModuleInitVo;
   import nslm2.modules.Chapters.ChapterModel;
   import com.mz.core.utils.ArrayUtil;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import flash.display.DisplayObject;
   import morn.customs.components.ModuleViewBase;
   import com.mz.core.utils.DisplayUtils;
   import flash.geom.Point;
   import morn.customs.components.PopModuleView;
   import com.mz.core.mgrs.ObserverMgr;
   
   public class PopModuleLayer extends ModuleLayerBase implements IObserver
   {
       
      
      private var conver:Sprite;
      
      public function PopModuleLayer()
      {
         super();
         conver = new Sprite();
         drawCover();
         conver.visible = false;
         this.addChild(this.conver);
         ObserverMgr.ins.regObserver(this);
      }
      
      private function drawCover(param1:Rectangle = null) : void
      {
         conver.graphics.clear();
         conver.graphics.beginFill(0,1);
         conver.graphics.drawRect(0,0,ClientConfig.SCENE_FIXED_W,ClientConfig.SCENE_FIXED_H);
         if(param1)
         {
            conver.graphics.drawRect(param1.x,param1.y,param1.width,param1.height);
         }
         conver.graphics.endFill();
      }
      
      override protected function layout() : void
      {
         super.layout();
         this.validateCover();
      }
      
      public function get curModuleId() : int
      {
         if(this.moduleList.length > 0)
         {
            return this.moduleList[this.moduleList.length - 1].configVo.moduleId;
         }
         return 0;
      }
      
      override public function showModule(param1:uint, param2:Object = null, param3:int = 0, param4:* = null) : ModuleInfoVo
      {
         var _loc7_:* = 0;
         var _loc5_:* = null;
         var _loc10_:int = 0;
         var _loc6_:* = null;
         if(this.curModuleId == param1)
         {
            Log.warn(this,"已经打开的模块,再次调用了showModule",param1);
            return this.moduleList[this.moduleList.length - 1];
         }
         var _loc9_:ModuleConfigVo = ModuleMgr.ins.getConfigVo(param1);
         if(param3 || _loc9_.useCoverKind == 1)
         {
            drawCover(null);
            if(isNaN(_loc9_.coverAlpha) == false)
            {
               conver.alpha = _loc9_.coverAlpha;
            }
            else
            {
               conver.alpha = 0.2;
            }
            this.addChild(this.conver);
            this.conver.visible = true;
         }
         if(this.curModuleId == 40400 && param3 != 40400)
         {
            GlobalRef.chapterModuleShowAgainVo = new ChapterModuleInitVo(ChapterModel.ins.lastOpenChapterId,0,false);
         }
         var _loc8_:ModuleInfoVo = this.getModuleInfo(param1);
         if(_loc8_ != null)
         {
            _loc7_ = int(_loc8_.moduleId);
         }
         else
         {
            _loc7_ = param3;
         }
         if(_loc7_)
         {
            _loc5_ = ModuleMgr.ins.getConfigVo(_loc7_);
            if(_loc5_.layerKind != 3)
            {
               throw new Error("$parentModuleId 必须是 PopModule");
            }
            _loc10_ = this.moduleList.length;
            while(true)
            {
               _loc10_--;
               if(_loc10_ > -1)
               {
                  _loc6_ = this.moduleList[_loc10_];
                  if(_loc6_.moduleId != _loc7_)
                  {
                     this.closeModule(_loc6_.moduleId);
                     continue;
                  }
                  break;
               }
               break;
            }
         }
         else
         {
            this.closeAll([param1]);
         }
         if(_loc8_)
         {
            return _loc8_;
         }
         return super.showModule(param1,param2,param3,param4);
      }
      
      override public function closeModule(param1:uint, param2:Object = null) : void
      {
         var _loc3_:ModuleInfoVo = ArrayUtil.findByAttr(this.moduleList,"parentModuleId",param1);
         if(_loc3_)
         {
            if(_loc3_.moduleId != param1)
            {
               this.closeModule(_loc3_.moduleId);
            }
         }
         super.closeModule(param1,param2);
         if(GlobalRef.chapterModuleShowAgainVo && this.moduleList.length == 0)
         {
            ModuleMgr.ins.showModule(40400,GlobalRef.chapterModuleShowAgainVo);
            GlobalRef.chapterModuleShowAgainVo = null;
         }
         if(this.moduleList.length == 0 && GlobalRef.needShowVip && NGUtil.isShow == false && ModuleMgr.ins.isShow(10400))
         {
            ModuleMgr.ins.showModule(12100);
         }
      }
      
      private function validateCover() : void
      {
         var _loc2_:* = null;
         var _loc4_:* = null;
         var _loc1_:* = null;
         var _loc5_:int = 0;
         var _loc3_:uint = this.numChildren;
         _loc5_ = _loc3_ - 1;
         while(_loc5_ >= 0)
         {
            _loc1_ = this.getChildAt(_loc5_);
            if(_loc1_ is ModuleViewBase)
            {
               _loc2_ = this.getModuleInfo((_loc1_ as ModuleViewBase).moduleId);
               if(_loc2_ && _loc2_.isShow)
               {
                  if(_loc4_)
                  {
                     if(_loc4_.configVo.useCoverKind == 4)
                     {
                        this.conver.visible = false;
                     }
                     else
                     {
                        if(isNaN(_loc4_.configVo.coverAlpha) == false)
                        {
                           conver.alpha = _loc4_.configVo.coverAlpha;
                        }
                        else
                        {
                           this.conver.alpha = 0.2;
                        }
                        this.conver.visible = true;
                        DisplayUtils.addChildBelow(this.conver,_loc4_.module);
                     }
                     return;
                  }
                  if(_loc2_.configVo.useCoverKind == 1)
                  {
                     if(isNaN(_loc2_.configVo.coverAlpha) == false)
                     {
                        conver.alpha = _loc2_.configVo.coverAlpha;
                     }
                     else
                     {
                        conver.alpha = 0.2;
                     }
                     this.conver.visible = true;
                     DisplayUtils.addChildBelow(this.conver,_loc2_.module);
                     return;
                  }
                  _loc4_ = _loc2_;
               }
            }
            _loc5_--;
         }
         this.conver.visible = false;
      }
      
      public function getFocusNotices() : Array
      {
         return ["MSG_POP_MODULE_HOLE","MSG_POP_UI_PANEL_3D_INIT","MSG_POP_UI_PANEL_3D_DISPOSE"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc4_:* = null;
         var _loc3_:* = null;
         var _loc6_:int = 0;
         var _loc9_:Boolean = false;
         var _loc7_:* = 0;
         var _loc5_:* = null;
         var _loc8_:int = 0;
         var _loc10_:* = param1;
         if("MSG_POP_MODULE_HOLE" !== _loc10_)
         {
            if("MSG_POP_UI_PANEL_3D_INIT" !== _loc10_)
            {
               if("MSG_POP_UI_PANEL_3D_DISPOSE" === _loc10_)
               {
                  drawCover(null);
                  _loc7_ = uint(this.numChildren);
                  _loc8_ = _loc7_ - 1;
                  while(_loc8_ >= 0)
                  {
                     _loc5_ = this.getChildAt(_loc8_);
                     if(_loc5_ is PopModuleView)
                     {
                        (_loc5_ as PopModuleView).switchByUIPanel3D(false,param2 as int);
                     }
                     _loc8_--;
                  }
               }
            }
            else
            {
               _loc6_ = param2[0] as int;
               _loc9_ = true;
               _loc7_ = uint(this.numChildren);
               _loc8_ = _loc7_ - 1;
               while(_loc8_ >= 0)
               {
                  _loc5_ = this.getChildAt(_loc8_);
                  if(_loc5_ is PopModuleView)
                  {
                     if(_loc9_)
                     {
                        _loc9_ = false;
                     }
                     else
                     {
                        (_loc5_ as PopModuleView).switchByUIPanel3D(true,_loc6_);
                     }
                  }
                  _loc8_--;
               }
            }
         }
         else
         {
            _loc4_ = param2 as Rectangle;
            if(_loc4_)
            {
               _loc3_ = this.conver.globalToLocal(new Point(_loc4_.x,_loc4_.y));
               drawCover(new Rectangle(_loc3_.x,_loc3_.y,_loc4_.width,_loc4_.height));
            }
            else
            {
               drawCover(null);
            }
         }
      }
   }
}
