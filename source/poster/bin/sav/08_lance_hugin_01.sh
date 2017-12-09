#!/bin/sh

# script vu sur cette page
# Hugin tutorial - Stitching flat scanned images
# http://hugin.sourceforge.net/tutorials/scans/en.shtml

# http://wiki.panotools.org/Panorama_scripting_in_a_nutshell


Path='/home/fred/Images/d225_v4/'
Prefix='Assemblage_225'
FOV=10

# Initialisation du projet avec les differeentes images
pto_gen --projection=0 \
        --fov=30 \
        -o $Path/project1.pto \
        $Path/*

# Creation des objectifs (1 par pva)
pto_lensstack \
              --new-lens i0 \
              --new-lens i1 \
              --new-lens i2 \
              --new-lens i3 \
              --new-lens i4 \
              --new-lens i5 \
              --new-lens i6 \
              --new-lens i7 \
              --new-lens i8 \
              --new-lens i9 \
              --new-lens i10 \
              --new-lens i11 \
              --new-lens i12 \
              --new-lens i13 \
              --new-lens i14 \
              --new-lens i15 \
              --new-lens i16 \
              --new-lens i17 \
              --new-lens i18 \
              --new-lens i19 \
              --new-lens i20 \
              --new-lens i21 \
              --new-lens i22 \
              --new-lens i23 \
              --new-lens i24 \
              --new-lens i25 \
              --new-lens i26 \
              --new-lens i27 \
              --new-lens i28 \
              --new-lens i29 \
              --new-lens i30 \
              --new-lens i31 \
              --new-lens i32 \
              --new-lens i33 \
              --new-lens i34 \
              --new-lens i35 \
              --new-lens i36 \
              --new-lens i37 \
              --new-lens i38 \
              --new-lens i39 \
              --new-lens i40 \
              --new-lens i41 \
              --new-lens i42 \
              --new-lens i43 \
              --new-lens i44 \
              --new-lens i45 \
              --new-lens i46 \
              --new-lens i47 \
              --new-lens i48 \
              --new-lens i49 \
              --new-lens i50 \
              --new-lens i51 \
              --new-lens i52 \
              --new-lens i53 \
              --new-lens i54 \
              --new-lens i55 \
              --new-lens i56 \
              --new-lens i57 \
              --new-lens i58 \
              --new-lens i59 \
              --new-lens i60 \
              --new-lens i61 \
              --new-lens i62 \
              --new-lens i63 \
              --new-lens i64 \
              --new-lens i65 \
              --new-lens i66 \
              --new-lens i67 \
              --new-lens i68 \
              --new-lens i69 \
              --new-lens i70 \
              --new-lens i71 \
              --new-lens i72 \
              --new-lens i73 \
              --new-lens i74 \
              --new-lens i75 \
              --new-lens i76 \
              --new-lens i77 \
              --new-lens i78 \
              --new-lens i79 \
              --new-lens i80 \
              --new-lens i81 \
              --new-lens i82 \
              --new-lens i83 \
              --new-lens i84 \
              --new-lens i85 \
              --new-lens i86 \
              --new-lens i87 \
              --new-lens i88 \
              --new-lens i89 \
              --new-lens i90 \
              --new-lens i91 \
              --new-lens i92 \
              --new-lens i93 \
              --new-lens i94 \
              --new-lens i95 \
              --new-lens i96 \
              --new-lens i97 \
              --new-lens i98 \
              --new-lens i99 \
              --new-lens i100 \
              --new-lens i101 \
              --new-lens i102 \
              --new-lens i103 \
              --new-lens i104 \
              --new-lens i105 \
              --new-lens i106 \
              --new-lens i107 \
              --new-lens i108 \
              --new-lens i109 \
              --new-lens i110 \
              --new-lens i111 \
              --new-lens i112 \
              --new-lens i113 \
              --new-lens i114 \
              --new-lens i115 \
              --new-lens i116 \
              --new-lens i117 \
              --new-lens i118 \
              --new-lens i119 \
              --new-lens i120 \
              --new-lens i121 \
              --new-lens i122 \
              --new-lens i123 \
              --new-lens i124 \
              --new-lens i125 \
              --new-lens i126 \
              --new-lens i127 \
              --new-lens i128 \
              --new-lens i129 \
              --new-lens i130 \
              --new-lens i131 \
              --new-lens i132 \
              --new-lens i133 \
              --new-lens i134 \
              --new-lens i135 \
              --new-lens i136 \
              --new-lens i137 \
              --new-lens i138 \
              --new-lens i139 \
              --new-lens i140 \
              --new-lens i141 \
              --new-lens i142 \
              --new-lens i143 \
              --new-lens i144 \
              --new-lens i145 \
              --new-lens i146 \
              --new-lens i147 \
              --new-lens i148 \
              --new-lens i149 \
              --new-lens i150 \
              --new-lens i151 \
              --new-lens i152 \
              --new-lens i153 \
              --new-lens i154 \
              --new-lens i155 \
              --new-lens i156 \
              --new-lens i157 \
              --new-lens i158 \
              --new-lens i159 \
              --new-lens i160 \
              --new-lens i161 \
              --new-lens i162 \
              --new-lens i163 \
              --new-lens i164 \
              --new-lens i165 \
              --new-lens i166 \
              --new-lens i167 \
              --new-lens i168 \
              --new-lens i169 \
              --new-lens i170 \
              --new-lens i171 \
              --new-lens i172 \
              --new-lens i173 \
              --new-lens i174 \
              --new-lens i175 \
              --new-lens i176 \
              --new-lens i177 \
              --new-lens i178 \
              --new-lens i179 \
              --new-lens i180 \
              --new-lens i181 \
              --new-lens i182 \
              --new-lens i183 \
              --new-lens i184 \
              --new-lens i185 \
              --new-lens i186 \
              --new-lens i187 \
              --new-lens i188 \
              --new-lens i189 \
              --new-lens i190 \
              --new-lens i191 \
              --new-lens i192 \
              --new-lens i193 \
              --new-lens i194 \
              --new-lens i195 \
              --new-lens i196 \
              --new-lens i197 \
              --new-lens i198 \
              --new-lens i199 \
              --new-lens i200 \
              --new-lens i201 \
              --new-lens i202 \
              --new-lens i203 \
              --new-lens i204 \
              --new-lens i205 \
              --new-lens i206 \
              --new-lens i207 \
              --new-lens i208 \
              --new-lens i209 \
              --new-lens i210 \
              --new-lens i211 \
              --new-lens i212 \
              --new-lens i213 \
              --new-lens i214 \
              --new-lens i215 \
              --new-lens i216 \
              --new-lens i217 \
              --new-lens i218 \
              --new-lens i219 \
              --new-lens i220 \
              --new-lens i221 \
              --new-lens i222 \
              --new-lens i223 \
              --new-lens i224 \
              --new-lens i225 \
              --new-lens i226 \
              --new-lens i227 \
              --new-lens i228 \
              --new-lens i229 \
              --new-lens i230 \
              --new-lens i231 \
              --new-lens i232 \
              --new-lens i233 \
              --new-lens i234 \
              --new-lens i235 \
              --new-lens i236 \
              --new-lens i237 \
              --new-lens i238 \
              --new-lens i239 \
              --new-lens i240 \
              --new-lens i241 \
              --new-lens i242 \
              --new-lens i243 \
              --new-lens i244 \
              --new-lens i245 \
              --new-lens i246 \
              --new-lens i247 \
              --new-lens i248 \
              --new-lens i249 \
              --new-lens i250 \
              --new-lens i251 \
              --new-lens i252 \
              --new-lens i253 \
              --new-lens i254 \
              --new-lens i255 \
              --new-lens i256 \
              --new-lens i257 \
              --new-lens i258 \
              --new-lens i259 \
              --new-lens i260 \
              --new-lens i261 \
              --new-lens i262 \
              --new-lens i263 \
              --new-lens i264 \
              --new-lens i265 \
              --new-lens i266 \
              --new-lens i267 \
              --new-lens i268 \
              --new-lens i269 \
              --new-lens i270 \
              --new-lens i271 \
              --new-lens i272 \
              --new-lens i273 \
              --new-lens i274 \
              --new-lens i275 \
              --new-lens i276 \
              --new-lens i277 \
              --new-lens i278 \
              --new-lens i279 \
              --new-lens i280 \
              --new-lens i281 \
              --new-lens i282 \
              --new-lens i283 \
              --new-lens i284 \
              --new-lens i285 \
              --new-lens i286 \
              --new-lens i287 \
              --new-lens i288 \
              --new-lens i289 \
              --new-lens i290 \
              --new-lens i291 \
              --new-lens i292 \
              --new-lens i293 \
              --new-lens i294 \
              --new-lens i295 \
              --new-lens i296 \
              --new-lens i297 \
              --new-lens i298 \
              --new-lens i299 \
              --new-lens i300 \
              --new-lens i301 \
              --new-lens i302 \
              --new-lens i303 \
              --new-lens i304 \
              --new-lens i305 \
              --new-lens i306 \
              --new-lens i307 \
              --new-lens i308 \
              --new-lens i309 \
              --new-lens i310 \
              --new-lens i311 \
              --new-lens i312 \
              --new-lens i313 \
              --new-lens i314 \
              --new-lens i315 \
              --new-lens i316 \
              --new-lens i317 \
              --new-lens i318 \
              --new-lens i319 \
              --new-lens i320 \
              --new-lens i321 \
              --new-lens i322 \
              --new-lens i323 \
              --new-lens i324 \
              --new-lens i325 \
              --new-lens i326 \
              --new-lens i327 \
              --new-lens i328 \
              --new-lens i329 \
              --new-lens i330 \
              --new-lens i331 \
              --new-lens i332 \
              --new-lens i333 \
              --new-lens i334 \
              --new-lens i335 \
              --new-lens i336 \
              --new-lens i337 \
              --new-lens i338 \
              --new-lens i339 \
              --new-lens i340 \
              --new-lens i341 \
              --new-lens i342 \
              --new-lens i343 \
              --new-lens i344 \
              --new-lens i345 \
              --new-lens i346 \
              --new-lens i347 \
              --new-lens i348 \
              --new-lens i349 \
              --new-lens i350 \
              --new-lens i351 \
              --new-lens i352 \
              --new-lens i353 \
              --new-lens i354 \
              --new-lens i355 \
              --new-lens i356 \
              --new-lens i357 \
              --new-lens i358 \
              --new-lens i359 \
        -o $Path/project2.pto \
        $Path/project1.pto
