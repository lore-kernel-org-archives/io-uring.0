Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D953C585E
	for <io-uring@vger.kernel.org>; Fri, 11 Sep 2026 22:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789166530; cv=none; b=StBFdpjli4MdEraUtaIorueTrRKnXZx6hxlvCreA8SPNoZtczD0BXGhVp+XA0xrDxn3Lr9+wo1j6Kc6PBM+4wA5uQNlupAUploZa9jQwEoluk4SZR3l4mS+V2QPMx3p6wLPN3iQr/p4ET1+J4UWez7oFwSm4dosjiKsBGK3nCfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789166530; c=relaxed/simple;
	bh=Emj2orDwq+TLyUpyoqbTeu0kDi+iYHkJ66Z3x2M3kpY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yf1QC70P+i8XgvrHtbsKeRacuZf9pSIPJmHnyzN5DlOZbDtfo37d5Nju9OOScKHtKS9Zt/gdRTu9v1ykjodzhhe71wSAcsuxwDg9iWx1ybafsA4W4braA3ATbK9DcwkA/z+x8h5balpXt9w3+o39j1xH/liCBIWDo3pFN1WXoY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ZwicUVnd; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ZwicUVnd"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a605844571so93082a12.3
        for <io-uring@vger.kernel.org>; Fri, 11 Sep 2026 15:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789166526; x=1789771326; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C0IJ+jRiSwpoAInuExu0806wVM7DzlfDcKn5ukHmHWM=;
        b=ZwicUVndg/QzL1/tbUpHHki8gdjw72SE3wD4dETAoNEslZ3NOVMddjJiDw2FnTDg4v
         tkpz/A5mNCmtgmt3yGYoFNJ6SM7PVcVwsNZe7O9zXsX/cxNgPWCcfLqxsZo+hq/segTQ
         z1dC3pgD2swXkl119prr+rlIEC1Kp3b64v1G8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789166526; x=1789771326;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=C0IJ+jRiSwpoAInuExu0806wVM7DzlfDcKn5ukHmHWM=;
        b=GjzeRpPEAsQQmK4rWMYxoPTTw3USeIr+ICJUFe4Ns0H4QSmM/rvrqLiSRTpRiHPO4U
         q5B11eIQGTDhc/SbxZzMmaxPhY63p0CGCVjkuE4dJCCj9rIvA2nVhTmf6f6Wf5T0nAW9
         z3F0WjH4bVDMQfn9R/Y45wk7U2q0xse2sv/hHiynagzBcgXQg9TLEel7TwNW9JTbF1i5
         iXijX6pm2PkJ+sFb5sYVxeMoPRtZhZB2qe3bIwsdxxWNHsOG7Kn/ajO+lvX7luYHUL7I
         Vtf6uS3d0scP6/7l3aH0snsnd3r7lVAqatGip8U+tPzcJHbxBd4AXhkFcshjmZ4DAKsq
         RVvg==
X-Forwarded-Encrypted: i=1; AKwUvBxYenDlDiW0xE+U4sWV0bU6pnJJZGoxEm7udod513pwFHj0xgAqo5AolgvcbcurUV/jrEJK8VePrw==@vger.kernel.org
X-Gm-Message-State: AFuF++mJDVV7kibqUKAv+wEfRjR4gYgOB1z8YK51anjdKbwUs8QGzscx
	3+eE5DqzLkKK/1IO89ddMmyW220klatNaEmNi6TobJn2MZFUq06Tz2KxNVbnNCMTBT3MV74ot6V
	ZE0+wU/E=
X-Gm-Gg: AYBFou121aBiho3g5V7sNAmLHyzMg8H+EnppiBdvVeICWkgOfzgC9dVGJpKRYo8+yAV
	Y7CY3F1N0bBYuVgXoySPgqBNBRLTBWSaLK6IhRyzFhrZrdWRdf7RDhPDUQn1hfXF3YVZAYv+lfF
	Zjhr7duKiV42qWrUgvpMKIy3wyUVJdMrkD5tJ+c3Se9xoqjmOB1liP4tyCU3z0C1nburTlGZr0i
	yQ7Mmwnl1JGS3G0c4ajuRC/shK6QKPZ6zXRTHom7EXvpOpBAFWOxB5tGiaDIf375cCuuDzkftz+
	THnGPZqjJR6tdvDPgqyA/YP4PQUwuXB1kk//aCX1mnNQx1+eaPrK2WJoNlwCbw853S7FH2uAv/f
	2R/kkaO3SAyELWOCo3LdDwRvmhgCLEmyM5OrQU//vhEpfVknVT4Dkk0qqN6BBGhYLqpdos6a+oT
	V2OOm84ORzsA2uP7F9pzIkRkmclTVL9AROYS2gDIBrO6nLBoZDooxSID+ObNzI9GHuJpduxkTTu
	w4SMuNdkIXexWsDbgEahsXKNUM26r5dBGOgZ9DQEztTvZterh3xpu7RL8fv
X-Received: by 2002:a05:6402:2186:b0:6a7:ea54:399 with SMTP id 4fb4d7f45d1cf-6a9cd3bc291mr155679a12.42.1789166526176;
        Fri, 11 Sep 2026 15:42:06 -0700 (PDT)
Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com. [74.125.228.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9bc808adfsm1086951a12.4.2026.09.11.15.42.05
        for <io-uring@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 15:42:05 -0700 (PDT)
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f6c7a56so10718266b.1
        for <io-uring@vger.kernel.org>; Fri, 11 Sep 2026 15:42:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxxoN8+1bdTXbjVXe4HZnU/XNxPbmM3bPdT+YAEGELNoByk9ySp44rvu+lIKX/9UCbR9fhQGNrN6w==@vger.kernel.org
X-Received: by 2002:a17:907:970f:b0:c29:6136:3df1 with SMTP id
 a640c23a62f3a-c29858e8fa4mr14946366b.34.1789166525306; Fri, 11 Sep 2026
 15:42:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <fb210ac8-b00b-42ff-8fc1-6f9243302b61@kernel.dk>
In-Reply-To: <fb210ac8-b00b-42ff-8fc1-6f9243302b61@kernel.dk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 11 Sep 2026 15:41:49 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgscVQOpma5sANWVLEu_VWBbVDz3dxbBcc_JM0CcR7QJw@mail.gmail.com>
X-Gm-Features: AcwNN1UJoSJNO-vhWsZyiYIU_iBpB5lM2_Ass8azxe5zVawINj3xTfiRsZvTpMs
Message-ID: <CAHk-=wgscVQOpma5sANWVLEu_VWBbVDz3dxbBcc_JM0CcR7QJw@mail.gmail.com>
Subject: Re: [PATCH] mailmap: update entry for Jens Axboe
To: Jens Axboe <axboe@kernel.dk>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>, io-uring <io-uring@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 11 Sept 2026 at 14:45, Jens Axboe <axboe@kernel.dk> wrote:
>
> Linus, could you pick this one up directly? Thanks!

Done.

          Linus
