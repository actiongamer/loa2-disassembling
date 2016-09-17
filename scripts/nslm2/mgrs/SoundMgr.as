package nslm2.mgrs
{
   import flash.utils.Dictionary;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcStageVo;
   import morn.core.utils.StringUtils;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import flash.media.Sound;
   
   public class SoundMgr
   {
      
      private static var _ins:nslm2.mgrs.SoundMgr;
       
      
      public var curBack:nslm2.mgrs.SoundItem;
      
      public var curBackConfigVo:nslm2.mgrs.SoundConfigVo;
      
      private var _texiaoDictionary:Dictionary;
      
      private var _texiaoKey:int = 0;
      
      private var _openBack:Boolean = true;
      
      private var _openTexiao:Boolean = true;
      
      public function SoundMgr()
      {
         curBackConfigVo = new nslm2.mgrs.SoundConfigVo();
         super();
      }
      
      public static function get ins() : nslm2.mgrs.SoundMgr
      {
         if(!_ins)
         {
            _ins = new nslm2.mgrs.SoundMgr();
         }
         return _ins;
      }
      
      public function playBackSoundByStageId(param1:int) : void
      {
         var _loc2_:StcStageVo = StcMgr.ins.getStageVo(param1);
         if(_loc2_ == null)
         {
            return;
         }
         if(StringUtils.isNull(_loc2_.bgm) == false)
         {
            this.playBackSound(_loc2_.bgm);
         }
      }
      
      public function playBackSound(param1:String, param2:int = 0, param3:Boolean = true, param4:Boolean = false) : void
      {
         if(!param1)
         {
            return;
         }
         if(this.curBack && this.curBack._url == UrlLib.soundBack(param1))
         {
            return;
         }
         curBackConfigVo._backName = param1;
         curBackConfigVo._backRepeat = param2;
         curBackConfigVo._backPlay = param3;
         curBackConfigVo._backClear = param4;
         var _loc5_:nslm2.mgrs.SoundItem = new nslm2.mgrs.SoundItem();
         _loc5_.vo = curBackConfigVo;
         if(!_openBack)
         {
            return;
         }
         closeBack(false);
         _loc5_._backSound = new Sound();
         _loc5_._backInLoad = true;
         _loc5_._url = UrlLib.soundBack(param1);
         this.curBack = _loc5_;
         _loc5_.init();
      }
      
      public function playTexiaoSound(param1:String, param2:int = 1, param3:Boolean = true, param4:Boolean = true, param5:Boolean = true) : int
      {
         name = param1;
         repeat = param2;
         play = param3;
         clear = param4;
         systemEffect = param5;
         delInfo = function():void
         {
            clearTexiao(name,curTexiaoKey);
         };
         if(!_openTexiao)
         {
            return -1;
         }
         if(!_texiaoDictionary)
         {
            _texiaoDictionary = new Dictionary();
         }
         var info:InfoTexiaoSound = new InfoTexiaoSound(name,repeat,play,clear,delInfo,systemEffect);
         _texiaoKey = Number(_texiaoKey) + 1;
         var curTexiaoKey:int = _texiaoKey;
         if(_texiaoDictionary[name])
         {
            (_texiaoDictionary[name] as Array).push([_texiaoKey,info]);
         }
         else
         {
            _texiaoDictionary[name] = [[_texiaoKey,info]];
         }
         return _texiaoKey;
      }
      
      public function clearTexiao(param1:String = null, param2:int = 0, param3:Boolean = false) : void
      {
         var _loc4_:* = null;
         var _loc5_:int = 0;
         if(!_texiaoDictionary)
         {
            return;
         }
         if(param3)
         {
            var _loc8_:int = 0;
            var _loc7_:* = _texiaoDictionary;
            for(var _loc6_ in _texiaoDictionary)
            {
               delTexiaoArr(_texiaoDictionary[_loc6_] as Array);
               delete _texiaoDictionary[_loc6_];
            }
            return;
         }
         if(param2 == 0 && param1 != null && param1 != "")
         {
            if(!_texiaoDictionary[param1])
            {
               return;
            }
            delTexiaoArr(_texiaoDictionary[param1] as Array);
         }
         if(param2 > 0 && param1 != null && param1 != "")
         {
            if(!_texiaoDictionary[param1])
            {
               return;
            }
            _loc4_ = _texiaoDictionary[param1] as Array;
            _loc5_ = 0;
            while(_loc5_ < _loc4_.length)
            {
               if(_loc4_[_loc5_][0] == param2)
               {
                  (_loc4_[_loc5_][1] as InfoTexiaoSound).clear();
                  (_loc4_[_loc5_] as Array).length = 0;
                  break;
               }
               _loc5_++;
            }
            _loc4_.splice(_loc5_,1);
         }
      }
      
      public function set openBack(param1:Boolean) : void
      {
         _openBack = param1;
         if(_openBack)
         {
            this.playBackSound(curBackConfigVo._backName,curBackConfigVo._backRepeat,curBackConfigVo._backPlay,curBackConfigVo._backClear);
         }
         else
         {
            closeBack(true);
         }
      }
      
      public function playCurrBack() : void
      {
         if(_openBack)
         {
            this.playBackSound(curBackConfigVo._backName,curBackConfigVo._backRepeat,curBackConfigVo._backPlay,curBackConfigVo._backClear);
         }
      }
      
      public function closeBack(param1:Boolean) : void
      {
         if(this.curBack)
         {
            this.curBack.close(param1);
            this.curBack = null;
         }
      }
      
      public function get openBack() : Boolean
      {
         return _openBack;
      }
      
      public function set openTexiao(param1:Boolean) : void
      {
         _openTexiao = param1;
         if(!_openTexiao)
         {
            clearTexiao(null,0,true);
         }
      }
      
      public function updateBackVolume() : void
      {
         if(this.curBack)
         {
            this.curBack.updateBackVolume();
         }
      }
      
      public function get openTexiao() : Boolean
      {
         return _openTexiao;
      }
      
      private function delTexiaoArr(param1:Array) : void
      {
         var _loc3_:* = null;
         var _loc2_:int = 0;
         if(!param1)
         {
            return;
         }
         _loc2_ = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = param1[_loc2_][1] as InfoTexiaoSound;
            _loc3_.clear();
            param1[_loc2_] = null;
            _loc2_++;
         }
         param1.length = 0;
      }
   }
}
