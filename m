Received: from mail-yx2-f4.google.com (mail-yx2-f4.google.com [74.125.224.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2031372EED
	for <io-uring@vger.kernel.org>; Sat, 26 Sep 2026 18:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.132
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790446169; cv=pass; b=VjmqU1+A6KTxJ1GdLPemN8pEqPE+DdQzmmC42VvMIldmjjbFlDqhKEOLEkG8IJqmeMLMzZF7Wd/j2dHTN9DYPi8heNljph7kMbkkeD4U5XeyMX7/iPLMS/ZCB8+2hwbpDVp4k7VukDCdAa0MkCaHz7glmMLJ7IPixpYKjlwudpo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790446169; c=relaxed/simple;
	bh=qy89InjtEXbF2ITmG8KXfZnO7uUJYNljnefoSke15tg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=jpgWD/EuttCkXhpG9hFaIpw1qf0pLI4nj3H9Ep4ggL65LYExSGhQJjGsgJaMXwe1zpW9/rkOLdAbt7Bnx1zBrWe0ElXbmDRJ5OC0TYk0JNeznw1E5s7vZrr53z5DtnYDD+UVpWZanneGu0IZM0RDEshCsXV9XGBORUk392Z7Mr4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AfI/hwfY; arc=pass smtp.client-ip=74.125.224.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AfI/hwfY"
Received: by mail-yx2-f4.google.com with SMTP id 956f58d0204a3-66fb34fa3b6so480635d50.0
        for <io-uring@vger.kernel.org>; Sat, 26 Sep 2026 11:09:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790446166; cv=none;
        d=google.com; s=arc-20260327;
        b=FmRltMd7sHTzxeZVSeYtmrKJp+xcWK0gkRschOdClQThMo41tKNEUKacLS1Y7G+g2n
         a8rRyLpExKKe/CswQ1mokF1EDonVJs+/E5wN9SesdKSBXdPzagZM9KfrdEd626AvNmIY
         80Lw7Ori5A8a6HJUZC+Q0GLGMvJSGsrpDfdC42zF2i6ho+xWVMCO3BPTAZFfe8XKn6gi
         6OxZP+xaSzjsfWH8S9xbEVz+qxcO7viIX6N5PZDVRuhwJdvzWWYMEPKxJ+NQzhOZqlBu
         QZEcvkl/NMxAGK36rHW98EnwAyhf3Euqb+GiM5w4y7S5li66wPkpUs21fawApWy79ugM
         +mmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=7kEbotDudozPXKr20GBCiX20OxhL9cFwKyl7OOVMfdA=;
        fh=XQkVQ83ZOruwepCzmoCC7SpKTd/yrAzY5dfBjDkSigM=;
        b=BBKrZDoqbtXMT2Hqma+e2Op9Dk6DdVzU0YCkMDcHJf1n9VWAHcx7ksNB4M7VkgMUwc
         3NPvwcgpWHQ7mPmF2nvLWEtfyICf9eQKtTfvv6eXwz6619rVDAjuSyM/X1QoARDh+Y3U
         pb7DZqUEn7DJSf78i1i/r71rm9nYqLlVCMTzaYX8mZyK0IwhtVhad0yXWbD9VJVY5K7G
         E/E1mhL8C0pWJkSPXkOMx6r8BkSmrsgxB3XTqE9XMCMrvRrafhEcOCpDJIyJlVBNcHRX
         07OGn6z0DB9Yv4e1oCyFQ42Na0SFEoWSmk308ZM3WUkZlJmQIfksnwOVs+40V5PhTfAN
         lPAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790446166; x=1791050966; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7kEbotDudozPXKr20GBCiX20OxhL9cFwKyl7OOVMfdA=;
        b=AfI/hwfYb2U9kJ8/ejbmOMy/Hd0PN9i2B1Ku5OWu8KzSx/zHC4k7ZnlR8sj8X2vw3s
         z32G3OSkmo9h8r+IsRa8FJH85vu1R9Ifbtwilhu1ZHx4TxJpEdgJMKNOzsMeu4zwsYa4
         SfanoCK+9z0kKM3JUqDTFy0mVD6l1AkoDmMMExMmW7TH7CZJuwgeUmtdzKLhk1BqBqKj
         vqPYtnyl1MyoF24/c9t2sUF0Gbly4D5SyVKn4Wqd8AqvjAwDhKQQmHDYMaUxOxl5fbGA
         Y7iMret+yc9tXvdAp/qtqdk52ZSxAEI6cvcRS1mYcNWh0g4P2goo3erKgi3MLAovFlRb
         hEZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790446166; x=1791050966;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7kEbotDudozPXKr20GBCiX20OxhL9cFwKyl7OOVMfdA=;
        b=JPT9PYuO2mOcxcg6xCdmFx9d4lQsZBYEgsu+mDBw6V8DfwObFKXml72wyhTGqpcuUa
         cIZvUNNzL+z/jnblB6M36GAAl/jhAy55ZqRUcAmexHtOUaDDCb+aGgwmari6GpeVO9zi
         M8RalZ0JWSvs8fTf3jLXTveDVGwhpzEQZl68UIGlWoJ6QLpJ/7rxlOTdnM8BNLCNCpTm
         lodXCOF35r48PXYZv6S3diMae8LbxB4S9rYC6zd684Kwy8lxo9WMF7okP1DACu/Zv7zX
         AU8esZ54lEZg0ShR74mGXfe8wSWpeo67aODtrOJ2/Wr7ZtdyfycdpiZC3Uk7f3K9AsBe
         9F2Q==
X-Gm-Message-State: AFq9FYLXfXqF498stzV397+I45+FdY3UpGWZujSi6LFGGh6la86TQMQj
	xRSFI/g/B2K9JlE72igiXdzdYP2P1rAgjKPsyvYrgcvR107lRw8WXu+Ys87aBM3C+gJVXZoon7v
	Bs8CrTOrRZZK7uXg0Xpn82P4mju3kVy5LtWun6Eo=
X-Gm-Gg: AYBFou0/jOKKgyjlp3NYHhvS8r1Sv43qB+fcVH6gLrNuSqj07yZKQDJVekj/IPtb+Yb
	u6fEa7BqVeS0sG0jfjpKDiDf58Ku86PBjrXw2vBIOcg6zyEtLoUYmGNJcn2Fult6kZc2xNitQof
	MVatiD0P3ShaXcIcjm1Zl6ZyWIvEj9O6j5TTN6zIS+byEKyYu35D9t6tNpCkIl5RUcCgBqli9yg
	DZ9BsTc6JEZ3NI2Nw6d0gviKephPcmoom5FXAdLx7jCJ411lvNH0SdY+YoqeYsiYcfO8eu8YeDs
	IN69j8bSAEq7ky4wv+iaIGGFYwf6XB7g8B8TzCxSaJwlJIcoFvJnlQvAAelJuLx6ZA==
X-Received: by 2002:a05:690e:1306:b0:672:9f72:7c0b with SMTP id
 956f58d0204a3-672ed508b0amr3297487d50.109.1790446166432; Sat, 26 Sep 2026
 11:09:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Leonid Ovchinnikov <teiny.work@gmail.com>
Date: Sun, 27 Sep 2026 04:09:14 +1000
X-Gm-Features: AclHuK99skDTxGunnS3sp83bPQr5utiwusrnbPh9zqtWBgP-DlbtaiR3hLTwO4M
Message-ID: <CAECZYD5OMD9vMTzjteFMMP40Dn+SWKj9SFj=43U6uO3XMnxJbw@mail.gmail.com>
Subject: [BUG] io_uring: mixed CQE cache bypasses an older overflowed CQE
To: io-uring@vger.kernel.org
Cc: "axboe@kernel.dk" <axboe@kernel.dk>
Content-Type: multipart/mixed; boundary="000000000000bd9a22065c66bb88"

--000000000000bd9a22065c66bb88
Content-Type: multipart/alternative; boundary="000000000000bd9a20065c66bb86"

--000000000000bd9a20065c66bb86
Content-Type: text/plain; charset="UTF-8"

Hi,

While working on completion handling in my I/O library, I noticed
unexpected CQE ordering when using IORING_SETUP_CQE_MIXED.

I attached a small standalone C reproducer. It uses raw syscalls and
Linux headers, with no dependency on my library or liburing.

The sequence is:

1. Create an SQ and CQ with four slots each, using CQSIZE | CQE_MIXED.
2. Submit four NOPs and consume the first two completions.
   This leaves CQ head=2, tail=4, with two free slots.
3. Submit three more NOPs in one batch: A, B, C.
   Only B requests a 32-byte completion through IORING_NOP_CQE32.

I then receive A and C, while B goes into the overflow list.
After draining the CQ and calling GETEVENTS, B arrives last.

This produces A,C,B consistently in 100 runs. With only 16-byte CQEs,
or with enough free CQ space, the same test produces A,B,C in all
100 runs. All completions arrive exactly once, with successful results,
intact extension data, and no dropped CQEs.

Looking at io_cqe_cache_refill(), I suspect the following happens:
A leaves one cached slot; B needs two slots and falls back to overflow,
but the remaining cached slot stays available. C then uses that slot
without reaching the overflow check in io_cqe_cache_refill().

The comment in that function and commit aa1df3a360a0
("io_uring: fix CQE reordering") suggest that newer completions should
not bypass the overflow list. I am not assuming a general
submission-order guarantee for independent I/O operations.

I reproduced this on Linux 7.2.3-arch1-2, x86_64. The kernel taint value
is 12292; I have not yet tested an untainted vanilla kernel. The same
cache/refill pattern appears in upstream source at
fddfc3ec31799a932bb92f1b8a84cb3d1f963be9, but I have not run that kernel.

To build and run:

    cc -std=c11 -O2 -Wall -Wextra -Wconversion -Werror repro.c -o repro
    ./repro 100

The program prints the observed order; exit status zero means its
completion integrity checks passed, not that no reordering occurred.
The full output is attached.

Does this look like a missed cache invalidation case, or am I
overlooking something? I would be happy to test a fix.

Thanks,
Leonid Ovchinnikov
https://github.com/te1ny

--000000000000bd9a20065c66bb86
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br><br>While working on completion handling in my I/O =
library, I noticed<br>unexpected CQE ordering when using IORING_SETUP_CQE_M=
IXED.<br><br>I attached a small standalone C reproducer. It uses raw syscal=
ls and<br>Linux headers, with no dependency on my library or liburing.<br><=
br>The sequence is:<br><br>1. Create an SQ and CQ with four slots each, usi=
ng CQSIZE | CQE_MIXED.<br>2. Submit four NOPs and consume the first two com=
pletions.<br>=C2=A0 =C2=A0This leaves CQ head=3D2, tail=3D4, with two free =
slots.<br>3. Submit three more NOPs in one batch: A, B, C.<br>=C2=A0 =C2=A0=
Only B requests a 32-byte completion through IORING_NOP_CQE32.<br><br>I the=
n receive A and C, while B goes into the overflow list.<br>After draining t=
he CQ and calling GETEVENTS, B arrives last.<br><br>This produces A,C,B con=
sistently in 100 runs. With only 16-byte CQEs,<br>or with enough free CQ sp=
ace, the same test produces A,B,C in all<br>100 runs. All completions arriv=
e exactly once, with successful results,<br>intact extension data, and no d=
ropped CQEs.<br><br>Looking at io_cqe_cache_refill(), I suspect the followi=
ng happens:<br>A leaves one cached slot; B needs two slots and falls back t=
o overflow,<br>but the remaining cached slot stays available. C then uses t=
hat slot<br>without reaching the overflow check in io_cqe_cache_refill().<b=
r><br>The comment in that function and commit aa1df3a360a0<br>(&quot;io_uri=
ng: fix CQE reordering&quot;) suggest that newer completions should<br>not =
bypass the overflow list. I am not assuming a general<br>submission-order g=
uarantee for independent I/O operations.<br><br>I reproduced this on Linux =
7.2.3-arch1-2, x86_64. The kernel taint value<br>is 12292; I have not yet t=
ested an untainted vanilla kernel. The same<br>cache/refill pattern appears=
 in upstream source at<br>fddfc3ec31799a932bb92f1b8a84cb3d1f963be9, but I h=
ave not run that kernel.<br><br>To build and run:<br><br>=C2=A0 =C2=A0 cc -=
std=3Dc11 -O2 -Wall -Wextra -Wconversion -Werror repro.c -o repro<br>=C2=A0=
 =C2=A0 ./repro 100<br><br>The program prints the observed order; exit stat=
us zero means its<br>completion integrity checks passed, not that no reorde=
ring occurred.<br>The full output is attached.<br><br>Does this look like a=
 missed cache invalidation case, or am I<br>overlooking something? I would =
be happy to test a fix.<br><br>Thanks,<br>Leonid Ovchinnikov<br><a href=3D"=
https://github.com/te1ny">https://github.com/te1ny</a><br></div>

--000000000000bd9a20065c66bb86--
--000000000000bd9a22065c66bb88
Content-Type: text/plain; charset="US-ASCII"; name="output.txt"
Content-Disposition: attachment; filename="output.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_muip5ztl0>
X-Attachment-Id: f_muip5ztl0

a2VybmVsPTcuMi4zLWFyY2gxLTIgZmxhZ3M9Q1FTSVpFfENRRV9NSVhFRCBTUT00IENRPTQKY2Fz
ZT1taXhlZCBwcmVzc3VyZWQKcHJpbWVkOiBoZWFkPTIgdGFpbD00IHNxX2ZsYWdzPTAgZHJvcHBl
ZD0wCmFmdGVyIEEvQi9DIGJhdGNoOiBoZWFkPTIgdGFpbD02IHNxX2ZsYWdzPTB4MiBkcm9wcGVk
PTAKICBpZD0xMiBzaXplPTE2CiAgaWQ9MTMgc2l6ZT0xNgogIGlkPTEwMCBzaXplPTE2CiAgaWQ9
MTAyIHNpemU9MTYKYWZ0ZXIgR0VURVZFTlRTOiBoZWFkPTYgdGFpbD04IHNxX2ZsYWdzPTAgZHJv
cHBlZD0wCiAgaWQ9MTAxIHNpemU9MzIKaXRlcmF0aW9ucz0xMDAgQS1DLUI9MTAwIEEtQi1DPTAK
Y2FzZT1hbGwxNiBwcmVzc3VyZWQKcHJpbWVkOiBoZWFkPTIgdGFpbD00IHNxX2ZsYWdzPTAgZHJv
cHBlZD0wCmFmdGVyIEEvQi9DIGJhdGNoOiBoZWFkPTIgdGFpbD02IHNxX2ZsYWdzPTB4MiBkcm9w
cGVkPTAKICBpZD0xMiBzaXplPTE2CiAgaWQ9MTMgc2l6ZT0xNgogIGlkPTEwMCBzaXplPTE2CiAg
aWQ9MTAxIHNpemU9MTYKYWZ0ZXIgR0VURVZFTlRTOiBoZWFkPTYgdGFpbD03IHNxX2ZsYWdzPTAg
ZHJvcHBlZD0wCiAgaWQ9MTAyIHNpemU9MTYKaXRlcmF0aW9ucz0xMDAgQS1DLUI9MCBBLUItQz0x
MDAKY2FzZT1taXhlZCByb29tCnByaW1lZDogaGVhZD00IHRhaWw9NCBzcV9mbGFncz0wIGRyb3Bw
ZWQ9MAphZnRlciBBL0IvQyBiYXRjaDogaGVhZD00IHRhaWw9OCBzcV9mbGFncz0wIGRyb3BwZWQ9
MAogIGlkPTEwMCBzaXplPTE2CiAgaWQ9MTAxIHNpemU9MzIKICBpZD0xMDIgc2l6ZT0xNgppdGVy
YXRpb25zPTEwMCBBLUMtQj0wIEEtQi1DPTEwMAo=
--000000000000bd9a22065c66bb88
Content-Type: text/x-csrc; charset="US-ASCII"; name="repro.c"
Content-Disposition: attachment; filename="repro.c"
Content-Transfer-Encoding: base64
Content-ID: <f_muip5zty1>
X-Attachment-Id: f_muip5zty1

LyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IE1JVCAqLwojZGVmaW5lIF9HTlVfU09VUkNFCiNp
bmNsdWRlIDxlcnJuby5oPgojaW5jbHVkZSA8aW50dHlwZXMuaD4KI2luY2x1ZGUgPGxpbnV4L2lv
X3VyaW5nLmg+CiNpbmNsdWRlIDxzdGRib29sLmg+CiNpbmNsdWRlIDxzdGRpbnQuaD4KI2luY2x1
ZGUgPHN0ZGlvLmg+CiNpbmNsdWRlIDxzdGRsaWIuaD4KI2luY2x1ZGUgPHN0cmluZy5oPgojaW5j
bHVkZSA8c3lzL21tYW4uaD4KI2luY2x1ZGUgPHN5cy9zeXNjYWxsLmg+CiNpbmNsdWRlIDxzeXMv
dXRzbmFtZS5oPgojaW5jbHVkZSA8dW5pc3RkLmg+CgpzdHJ1Y3QgcmluZyB7CiAgICBpbnQgZmQ7
CiAgICBzdHJ1Y3QgaW9fdXJpbmdfcGFyYW1zIHBhcmFtczsKICAgIHZvaWQgKnNxX21hcDsKICAg
IHZvaWQgKmNxX21hcDsKICAgIHN0cnVjdCBpb191cmluZ19zcWUgKnNxZXM7CiAgICBzaXplX3Qg
c3Ffc2l6ZTsKICAgIHNpemVfdCBjcV9zaXplOwogICAgdWludDMyX3QgKnNxX2hlYWQ7CiAgICB1
aW50MzJfdCAqc3FfdGFpbDsKICAgIHVpbnQzMl90ICpzcV9mbGFnczsKICAgIHVpbnQzMl90ICpz
cV9hcnJheTsKICAgIHVpbnQzMl90ICpjcV9oZWFkOwogICAgdWludDMyX3QgKmNxX3RhaWw7CiAg
ICB1aW50MzJfdCAqY3Ffb3ZlcmZsb3c7CiAgICBzdHJ1Y3QgaW9fdXJpbmdfY3FlICpjcWVzOwp9
OwoKc3RydWN0IHJlc3VsdHMgewogICAgdWludDY0X3QgaWRzWzhdOwogICAgdW5zaWduZWQgY291
bnQ7Cn07CgpzdGF0aWMgdm9pZCBjaGVjayhib29sIGNvbmRpdGlvbiwgY29uc3QgY2hhciAqbWVz
c2FnZSkKewogICAgaWYgKCFjb25kaXRpb24pIHsKICAgICAgICBmcHJpbnRmKHN0ZGVyciwgIiVz
IChlcnJubz0lZDogJXMpXG4iLCBtZXNzYWdlLCBlcnJubywgc3RyZXJyb3IoZXJybm8pKTsKICAg
ICAgICBleGl0KDIpOwogICAgfQp9CgpzdGF0aWMgdWludDMyX3QgbG9hZChjb25zdCB1aW50MzJf
dCAqcCkKewogICAgcmV0dXJuIF9fYXRvbWljX2xvYWRfbihwLCBfX0FUT01JQ19BQ1FVSVJFKTsK
fQoKc3RhdGljIHZvaWQgc3RvcmUodWludDMyX3QgKnAsIHVpbnQzMl90IHZhbHVlKQp7CiAgICBf
X2F0b21pY19zdG9yZV9uKHAsIHZhbHVlLCBfX0FUT01JQ19SRUxFQVNFKTsKfQoKc3RhdGljIHVp
bnQzMl90ICpmaWVsZCh2b2lkICptYXBwaW5nLCB1aW50MzJfdCBvZmZzZXQpCnsKICAgIHJldHVy
biAodWludDMyX3QgKikoKGNoYXIgKiltYXBwaW5nICsgb2Zmc2V0KTsKfQoKc3RhdGljIHZvaWQg
Y3JlYXRlX3Jpbmcoc3RydWN0IHJpbmcgKnIpCnsKICAgIG1lbXNldChyLCAwLCBzaXplb2YoKnIp
KTsKICAgIHItPnBhcmFtcy5mbGFncyA9IElPUklOR19TRVRVUF9DUVNJWkUgfCBJT1JJTkdfU0VU
VVBfQ1FFX01JWEVEOwogICAgci0+cGFyYW1zLmNxX2VudHJpZXMgPSA0OwogICAgci0+ZmQgPSAo
aW50KXN5c2NhbGwoX19OUl9pb191cmluZ19zZXR1cCwgNCwgJnItPnBhcmFtcyk7CiAgICBjaGVj
ayhyLT5mZCA+PSAwLCAiaW9fdXJpbmdfc2V0dXAgZmFpbGVkIik7CiAgICBjaGVjayhyLT5wYXJh
bXMuc3FfZW50cmllcyA9PSA0ICYmIHItPnBhcmFtcy5jcV9lbnRyaWVzID09IDQsCiAgICAgICAg
ICAidW5leHBlY3RlZCByaW5nIGNhcGFjaXR5Iik7CgogICAgci0+c3Ffc2l6ZSA9IHItPnBhcmFt
cy5zcV9vZmYuYXJyYXkgKyA0ICogc2l6ZW9mKHVpbnQzMl90KTsKICAgIHItPmNxX3NpemUgPSBy
LT5wYXJhbXMuY3Ffb2ZmLmNxZXMgKyA0ICogc2l6ZW9mKHN0cnVjdCBpb191cmluZ19jcWUpOwog
ICAgci0+c3FfbWFwID0gbW1hcChOVUxMLCByLT5zcV9zaXplLCBQUk9UX1JFQUQgfCBQUk9UX1dS
SVRFLAogICAgICAgICAgICAgICAgICAgICBNQVBfU0hBUkVELCByLT5mZCwgSU9SSU5HX09GRl9T
UV9SSU5HKTsKICAgIHItPmNxX21hcCA9IG1tYXAoTlVMTCwgci0+Y3Ffc2l6ZSwgUFJPVF9SRUFE
IHwgUFJPVF9XUklURSwKICAgICAgICAgICAgICAgICAgICAgTUFQX1NIQVJFRCwgci0+ZmQsIElP
UklOR19PRkZfQ1FfUklORyk7CiAgICByLT5zcWVzID0gbW1hcChOVUxMLCA0ICogc2l6ZW9mKCpy
LT5zcWVzKSwgUFJPVF9SRUFEIHwgUFJPVF9XUklURSwKICAgICAgICAgICAgICAgICAgIE1BUF9T
SEFSRUQsIHItPmZkLCBJT1JJTkdfT0ZGX1NRRVMpOwogICAgY2hlY2soci0+c3FfbWFwICE9IE1B
UF9GQUlMRUQgJiYgci0+Y3FfbWFwICE9IE1BUF9GQUlMRUQgJiYKICAgICAgICAgIHItPnNxZXMg
IT0gTUFQX0ZBSUxFRCwgIm1tYXAgZmFpbGVkIik7CgogICAgci0+c3FfaGVhZCA9IGZpZWxkKHIt
PnNxX21hcCwgci0+cGFyYW1zLnNxX29mZi5oZWFkKTsKICAgIHItPnNxX3RhaWwgPSBmaWVsZChy
LT5zcV9tYXAsIHItPnBhcmFtcy5zcV9vZmYudGFpbCk7CiAgICByLT5zcV9mbGFncyA9IGZpZWxk
KHItPnNxX21hcCwgci0+cGFyYW1zLnNxX29mZi5mbGFncyk7CiAgICByLT5zcV9hcnJheSA9IGZp
ZWxkKHItPnNxX21hcCwgci0+cGFyYW1zLnNxX29mZi5hcnJheSk7CiAgICByLT5jcV9oZWFkID0g
ZmllbGQoci0+Y3FfbWFwLCByLT5wYXJhbXMuY3Ffb2ZmLmhlYWQpOwogICAgci0+Y3FfdGFpbCA9
IGZpZWxkKHItPmNxX21hcCwgci0+cGFyYW1zLmNxX29mZi50YWlsKTsKICAgIHItPmNxX292ZXJm
bG93ID0gZmllbGQoci0+Y3FfbWFwLCByLT5wYXJhbXMuY3Ffb2ZmLm92ZXJmbG93KTsKICAgIHIt
PmNxZXMgPSAodm9pZCAqKWZpZWxkKHItPmNxX21hcCwgci0+cGFyYW1zLmNxX29mZi5jcWVzKTsK
fQoKc3RhdGljIHZvaWQgZGVzdHJveV9yaW5nKHN0cnVjdCByaW5nICpyKQp7CiAgICBjaGVjayht
dW5tYXAoci0+c3FlcywgNCAqIHNpemVvZigqci0+c3FlcykpID09IDAsICJtdW5tYXAgU1FFcyBm
YWlsZWQiKTsKICAgIGNoZWNrKG11bm1hcChyLT5zcV9tYXAsIHItPnNxX3NpemUpID09IDAsICJt
dW5tYXAgU1EgZmFpbGVkIik7CiAgICBjaGVjayhtdW5tYXAoci0+Y3FfbWFwLCByLT5jcV9zaXpl
KSA9PSAwLCAibXVubWFwIENRIGZhaWxlZCIpOwogICAgY2hlY2soY2xvc2Uoci0+ZmQpID09IDAs
ICJjbG9zZSBmYWlsZWQiKTsKICAgIC8qIExldCBhc3luY2hyb25vdXMgcmluZyB0ZWFyZG93biBj
YXRjaCB1cCBkdXJpbmcgcmVwZWF0ZWQgcnVucy4gKi8KICAgIHVzbGVlcCgxMDAwKTsKfQoKc3Rh
dGljIHZvaWQgc3VibWl0X25vcHMoc3RydWN0IHJpbmcgKnIsIHVuc2lnbmVkIGNvdW50LAogICAg
ICAgICAgICAgICAgICAgICAgICB1aW50NjRfdCBmaXJzdF9pZCwgYm9vbCBiaWdfbWlkZGxlKQp7
CiAgICB1aW50MzJfdCB0YWlsID0gbG9hZChyLT5zcV90YWlsKTsKICAgIGNoZWNrKGNvdW50IDw9
IDQgJiYgdGFpbCAtIGxvYWQoci0+c3FfaGVhZCkgPD0gNCAtIGNvdW50LAogICAgICAgICAgImlu
c3VmZmljaWVudCBTUSBzcGFjZSIpOwogICAgZm9yICh1bnNpZ25lZCBpID0gMDsgaSA8IGNvdW50
OyArK2kpIHsKICAgICAgICB1aW50MzJfdCBzbG90ID0gKHRhaWwgKyBpKSAmIDM7CiAgICAgICAg
c3RydWN0IGlvX3VyaW5nX3NxZSAqc3FlID0gJnItPnNxZXNbc2xvdF07CiAgICAgICAgbWVtc2V0
KHNxZSwgMCwgc2l6ZW9mKCpzcWUpKTsKICAgICAgICBzcWUtPm9wY29kZSA9IElPUklOR19PUF9O
T1A7CiAgICAgICAgc3FlLT51c2VyX2RhdGEgPSBmaXJzdF9pZCArIGk7CiAgICAgICAgaWYgKGJp
Z19taWRkbGUgJiYgaSA9PSAxKSB7CiAgICAgICAgICAgIHNxZS0+bm9wX2ZsYWdzID0gSU9SSU5H
X05PUF9DUUUzMjsKICAgICAgICAgICAgc3FlLT5vZmYgPSAweGFiY2RlZjsKICAgICAgICAgICAg
c3FlLT5hZGRyID0gMHgxMjM0NTY7CiAgICAgICAgfQogICAgICAgIHItPnNxX2FycmF5W3Nsb3Rd
ID0gc2xvdDsKICAgIH0KICAgIHN0b3JlKHItPnNxX3RhaWwsIHRhaWwgKyBjb3VudCk7CiAgICBs
b25nIHJldCA9IHN5c2NhbGwoX19OUl9pb191cmluZ19lbnRlciwgci0+ZmQsIGNvdW50LCAwLCAw
LCBOVUxMLCAwKTsKICAgIGNoZWNrKHJldCA9PSAobG9uZyljb3VudCwgImlvX3VyaW5nX2VudGVy
IGRpZCBub3Qgc3VibWl0IGZ1bGwgYmF0Y2giKTsKfQoKc3RhdGljIHZvaWQgcHJpbnRfc3RhdGUo
c3RydWN0IHJpbmcgKnIsIGNvbnN0IGNoYXIgKmxhYmVsLCBib29sIHZlcmJvc2UpCnsKICAgIGNo
ZWNrKGxvYWQoci0+Y3Ffb3ZlcmZsb3cpID09IDAsICJDUUUgd2FzIGRyb3BwZWQiKTsKICAgIGlm
ICh2ZXJib3NlKQogICAgICAgIHByaW50ZigiJXM6IGhlYWQ9JXUgdGFpbD0ldSBzcV9mbGFncz0l
I3ggZHJvcHBlZD0ldVxuIiwgbGFiZWwsCiAgICAgICAgICAgICAgIGxvYWQoci0+Y3FfaGVhZCks
IGxvYWQoci0+Y3FfdGFpbCksIGxvYWQoci0+c3FfZmxhZ3MpLAogICAgICAgICAgICAgICBsb2Fk
KHItPmNxX292ZXJmbG93KSk7Cn0KCi8qIENvbnN1bWUgb25seSBlbnRyaWVzIGluIG9uZSBhY3F1
aXJlLXRhaWwgc25hcHNob3QuICovCnN0YXRpYyB2b2lkIGNvbnN1bWUoc3RydWN0IHJpbmcgKnIs
IHN0cnVjdCByZXN1bHRzICpvdXQsCiAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbGltaXQs
IGJvb2wgdmVyYm9zZSkKewogICAgdWludDMyX3QgaGVhZCA9IGxvYWQoci0+Y3FfaGVhZCk7CiAg
ICB1aW50MzJfdCB0YWlsID0gbG9hZChyLT5jcV90YWlsKTsKICAgIHVuc2lnbmVkIGNvbnN1bWVk
ID0gMDsKICAgIGNoZWNrKHRhaWwgLSBoZWFkIDw9IDQsICJpbnZhbGlkIENRIG9jY3VwYW5jeSIp
OwogICAgd2hpbGUgKGhlYWQgIT0gdGFpbCAmJiBjb25zdW1lZCA8IGxpbWl0KSB7CiAgICAgICAg
dWludDMyX3QgcGh5c2ljYWwgPSBoZWFkICYgMzsKICAgICAgICBzdHJ1Y3QgaW9fdXJpbmdfY3Fl
IGNxZSA9IHItPmNxZXNbcGh5c2ljYWxdOwogICAgICAgIHVuc2lnbmVkIHNsb3RzID0gKGNxZS5m
bGFncyAmIElPUklOR19DUUVfRl8zMikgPyAyIDogMTsKICAgICAgICBjaGVjayghKGNxZS5mbGFn
cyAmIElPUklOR19DUUVfRl9TS0lQKSwgInVuZXhwZWN0ZWQgZmlsbGVyIGluIHRoaXMgY2FzZSIp
OwogICAgICAgIGNoZWNrKGNxZS5yZXMgPT0gMCwgIk5PUCByZXR1cm5lZCBhbiBlcnJvciIpOwog
ICAgICAgIGNoZWNrKHRhaWwgLSBoZWFkID49IHNsb3RzLCAicGFydGlhbGx5IHB1Ymxpc2hlZCBD
UUUiKTsKICAgICAgICBpZiAoc2xvdHMgPT0gMikgewogICAgICAgICAgICB1aW50NjRfdCB3b3Jk
c1syXTsKICAgICAgICAgICAgY2hlY2socGh5c2ljYWwgPCAzLCAiYmlnIENRRSB3cmFwcyByaW5n
IGJvdW5kYXJ5Iik7CiAgICAgICAgICAgIG1lbWNweSh3b3JkcywgJnItPmNxZXNbcGh5c2ljYWwg
KyAxXSwgc2l6ZW9mKHdvcmRzKSk7CiAgICAgICAgICAgIGNoZWNrKHdvcmRzWzBdID09IDB4YWJj
ZGVmICYmIHdvcmRzWzFdID09IDB4MTIzNDU2LAogICAgICAgICAgICAgICAgICAiYmlnIENRRSBw
YXlsb2FkIG1pc21hdGNoIik7CiAgICAgICAgfQogICAgICAgIGNoZWNrKG91dC0+Y291bnQgPCBz
aXplb2Yob3V0LT5pZHMpIC8gc2l6ZW9mKG91dC0+aWRzWzBdKSwKICAgICAgICAgICAgICAicmVz
dWx0IGFycmF5IG92ZXJmbG93Iik7CiAgICAgICAgb3V0LT5pZHNbb3V0LT5jb3VudCsrXSA9IGNx
ZS51c2VyX2RhdGE7CiAgICAgICAgaWYgKHZlcmJvc2UpCiAgICAgICAgICAgIHByaW50ZigiICBp
ZD0lIiBQUkl1NjQgIiBzaXplPSV1XG4iLCAodWludDY0X3QpY3FlLnVzZXJfZGF0YSwKICAgICAg
ICAgICAgICAgICAgIHNsb3RzICogMTYpOwogICAgICAgIGhlYWQgKz0gc2xvdHM7CiAgICAgICAg
Kytjb25zdW1lZDsKICAgICAgICBzdG9yZShyLT5jcV9oZWFkLCBoZWFkKTsKICAgIH0KfQoKc3Rh
dGljIGJvb2wgcnVuX2Nhc2UodW5zaWduZWQgbW9kZSwgYm9vbCB2ZXJib3NlKQp7CiAgICBzdHJ1
Y3QgcmluZyByOwogICAgc3RydWN0IHJlc3VsdHMgc2VlbiA9IHswfTsKICAgIHVuc2lnbmVkIGNv
dW50c1s3XSA9IHswfTsKICAgIGNyZWF0ZV9yaW5nKCZyKTsKICAgIHN1Ym1pdF9ub3BzKCZyLCA0
LCAxMCwgZmFsc2UpOwogICAgY29uc3VtZSgmciwgJnNlZW4sIG1vZGUgPT0gMiA/IDQgOiAyLCBm
YWxzZSk7CiAgICBjaGVjayhzZWVuLmNvdW50ID09IChtb2RlID09IDIgPyA0VSA6IDJVKSwgInBy
aW1pbmcgQ1FFcyBtaXNzaW5nIik7CiAgICBmb3IgKHVuc2lnbmVkIGkgPSAwOyBpIDwgc2Vlbi5j
b3VudDsgKytpKQogICAgICAgIGNoZWNrKHNlZW4uaWRzW2ldID09IDEwICsgaSwgInVuZXhwZWN0
ZWQgcHJpbWluZyBjb21wbGV0aW9uIik7CiAgICBwcmludF9zdGF0ZSgmciwgInByaW1lZCIsIHZl
cmJvc2UpOwoKICAgIHN1Ym1pdF9ub3BzKCZyLCAzLCAxMDAsIG1vZGUgIT0gMSk7CiAgICBwcmlu
dF9zdGF0ZSgmciwgImFmdGVyIEEvQi9DIGJhdGNoIiwgdmVyYm9zZSk7CiAgICBjb25zdW1lKCZy
LCAmc2VlbiwgOCwgdmVyYm9zZSk7CiAgICBmb3IgKHVuc2lnbmVkIGF0dGVtcHQgPSAwOwogICAg
ICAgICBhdHRlbXB0IDwgNCAmJiAobG9hZChyLnNxX2ZsYWdzKSAmIElPUklOR19TUV9DUV9PVkVS
RkxPVyk7CiAgICAgICAgICsrYXR0ZW1wdCkgewogICAgICAgIGxvbmcgcmV0ID0gc3lzY2FsbChf
X05SX2lvX3VyaW5nX2VudGVyLCByLmZkLCAwLCAwLAogICAgICAgICAgICAgICAgICAgICAgICAg
ICBJT1JJTkdfRU5URVJfR0VURVZFTlRTLCBOVUxMLCAwKTsKICAgICAgICBjaGVjayhyZXQgPj0g
MCwgIkdFVEVWRU5UUyBmYWlsZWQiKTsKICAgICAgICBwcmludF9zdGF0ZSgmciwgImFmdGVyIEdF
VEVWRU5UUyIsIHZlcmJvc2UpOwogICAgICAgIGNvbnN1bWUoJnIsICZzZWVuLCA4LCB2ZXJib3Nl
KTsKICAgIH0KICAgIGNoZWNrKCEobG9hZChyLnNxX2ZsYWdzKSAmIElPUklOR19TUV9DUV9PVkVS
RkxPVyksICJiYWNrbG9nIHJlbWFpbnMiKTsKICAgIGNoZWNrKGxvYWQoci5jcV9oZWFkKSA9PSBs
b2FkKHIuY3FfdGFpbCksICJDUSByZW1haW5zIG5vbmVtcHR5Iik7CiAgICBjaGVjayhsb2FkKHIu
Y3Ffb3ZlcmZsb3cpID09IDAsICJDUUUgd2FzIGRyb3BwZWQiKTsKICAgIGNoZWNrKHNlZW4uY291
bnQgPT0gNywgIndyb25nIGNvbXBsZXRpb24gY291bnQiKTsKCiAgICB1bnNpZ25lZCBhID0gOCwg
YiA9IDgsIGMgPSA4OwogICAgZm9yICh1bnNpZ25lZCBpID0gMDsgaSA8IHNlZW4uY291bnQ7ICsr
aSkgewogICAgICAgIHVpbnQ2NF90IGlkID0gc2Vlbi5pZHNbaV07CiAgICAgICAgY2hlY2soKGlk
ID49IDEwICYmIGlkIDw9IDEzKSB8fCAoaWQgPj0gMTAwICYmIGlkIDw9IDEwMiksCiAgICAgICAg
ICAgICAgInVuZXhwZWN0ZWQgdXNlcl9kYXRhIik7CiAgICAgICAgKytjb3VudHNbaWQgPCAxMDAg
PyBpZCAtIDEwIDogaWQgLSA5Nl07CiAgICAgICAgaWYgKGlkID09IDEwMCkgYSA9IGk7CiAgICAg
ICAgaWYgKGlkID09IDEwMSkgYiA9IGk7CiAgICAgICAgaWYgKGlkID09IDEwMikgYyA9IGk7CiAg
ICB9CiAgICBmb3IgKHVuc2lnbmVkIGkgPSAwOyBpIDwgNzsgKytpKQogICAgICAgIGNoZWNrKGNv
dW50c1tpXSA9PSAxLCAiY29tcGxldGlvbiBtaXNzaW5nIG9yIGR1cGxpY2F0ZWQiKTsKICAgIGJv
b2wgcmVvcmRlcmVkID0gYSA8IGMgJiYgYyA8IGI7CiAgICBjaGVjayhyZW9yZGVyZWQgfHwgKGEg
PCBiICYmIGIgPCBjKSwgInVuZXhwZWN0ZWQgQS9CL0Mgb3JkZXIiKTsKICAgIGRlc3Ryb3lfcmlu
Zygmcik7CiAgICByZXR1cm4gcmVvcmRlcmVkOwp9CgppbnQgbWFpbihpbnQgYXJnYywgY2hhciAq
KmFyZ3YpCnsKICAgIHVuc2lnbmVkIGl0ZXJhdGlvbnMgPSAxMDA7CiAgICBzdHJ1Y3QgdXRzbmFt
ZSBpbmZvOwogICAgaWYgKGFyZ2MgPiAxKSB7CiAgICAgICAgY2hhciAqZW5kOwogICAgICAgIGVy
cm5vID0gMDsKICAgICAgICB1bnNpZ25lZCBsb25nIHZhbHVlID0gc3RydG91bChhcmd2WzFdLCAm
ZW5kLCAxMCk7CiAgICAgICAgY2hlY2soZXJybm8gPT0gMCAmJiBlbmQgIT0gYXJndlsxXSAmJiAq
ZW5kID09ICdcMCcgJiYKICAgICAgICAgICAgICB2YWx1ZSA+IDAgJiYgdmFsdWUgPD0gMTAwMDAw
LCAiaW52YWxpZCBpdGVyYXRpb24gY291bnQiKTsKICAgICAgICBpdGVyYXRpb25zID0gKHVuc2ln
bmVkKXZhbHVlOwogICAgfQogICAgY2hlY2sodW5hbWUoJmluZm8pID09IDAsICJ1bmFtZSBmYWls
ZWQiKTsKICAgIHByaW50Zigia2VybmVsPSVzIGZsYWdzPUNRU0laRXxDUUVfTUlYRUQgU1E9NCBD
UT00XG4iLCBpbmZvLnJlbGVhc2UpOwogICAgY29uc3QgY2hhciAqbmFtZXNbXSA9IHsibWl4ZWQg
cHJlc3N1cmVkIiwgImFsbDE2IHByZXNzdXJlZCIsICJtaXhlZCByb29tIn07CiAgICBmb3IgKHVu
c2lnbmVkIG1vZGUgPSAwOyBtb2RlIDwgMzsgKyttb2RlKSB7CiAgICAgICAgdW5zaWduZWQgcmVv
cmRlcmVkID0gMDsKICAgICAgICBwcmludGYoImNhc2U9JXNcbiIsIG5hbWVzW21vZGVdKTsKICAg
ICAgICBmb3IgKHVuc2lnbmVkIGkgPSAwOyBpIDwgaXRlcmF0aW9uczsgKytpKQogICAgICAgICAg
ICByZW9yZGVyZWQgKz0gcnVuX2Nhc2UobW9kZSwgaSA9PSAwKTsKICAgICAgICBwcmludGYoIml0
ZXJhdGlvbnM9JXUgQS1DLUI9JXUgQS1CLUM9JXVcbiIsIGl0ZXJhdGlvbnMsCiAgICAgICAgICAg
ICAgIHJlb3JkZXJlZCwgaXRlcmF0aW9ucyAtIHJlb3JkZXJlZCk7CiAgICB9CiAgICByZXR1cm4g
MDsKfQo=
--000000000000bd9a22065c66bb88--
