Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795627560;
	b=QuL7gOZOgE2uLOFM78sdNd94CbSwW+x8p3aAPHgk6Ax7CrVtsGDKyhhK+scnv+1D/9o7
	 wmlelealv4wNWTP8YVkVaq+UvGRom9l82W5gdKSXw5fWl/WsADTGLvROSBt2qzxOoFOlw
	 Ec+1aveUbGva9qIAVyccLVYGd3yuRdSKLZN90FhqdGusjMWJCIaYur9m4KLuBlkKVINCT
	 E9IOV/SGTM1m3Xt3Zl/fJYDV0vHRi1CMcledsRjI/fDHaUnRx/vxdrp3drqYDcekwPi8p
	 pgtHDk4pZrI6192osUmV0g5BZx0UfweVqAcy6Seb83OxuBgTeRJs/yVaVnZbCAL6oZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795627560;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=0eeo8xLsFVG8280bwD1Dy/maRtfEJTegVNCHlzkxjN0=;
	b=fNntHQpEegX6AZ4v3iPmBGW+15szHY2ZBIfcZaImevY4oHpQPQR0XPBTVwr2QLp/r/GF
	 Q3IgeU99/MnsIcxSowj+72sde5HZ1Ax2rmpQw9qm8bvo5/qklJ8c7VVU+2ZVEbAwSpJWe
	 ZwvS6GMHXHkNOK4ZO2fjoz9ICCcnPNEjLQL/8vQCocPaNgaK/AMimVq2kzS7oPorueMAI
	 Fi2w4lorNmWX1dDtvmkaizklGqP110M30CvVt/DwPuyK0wCa7d1trUAroepLnq0qkEN7O
	 L9nL+psJk5vurv3TK4FEnWTM6Jij4jXRMEZ+oWaki052uVUR8b345KSmByeBSmZUtJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=oPjzSfOF;
	arc=none smtp.remote-ip=209.85.210.42
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B041E606A337
	for <io-uring@vger.kernel.org>; Wed, 25 Nov 2026 17:25:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B041E606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=oPjzSfOF
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-8629ef8613aso2369027a34.3
        for <io-uring@vger.kernel.org>; Wed, 25 Nov 2026 09:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel.dk; s=google; t=1795627558; x=1796232358; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0eeo8xLsFVG8280bwD1Dy/maRtfEJTegVNCHlzkxjN0=;
        b=oPjzSfOFSO9WmY/3CFGiz7qJ+hchUaMMGQU4TqQExAYSlmvFhfuirwFe4TqkyefGgj
         Lpd/A2sH72M7fGSu6M2wtzdHv7mtUU9VXVBtEb/sozwVxhwKl+pfn9SYL9CNa9nE7QG2
         Ix8opVtmfRkZdFs3wacVD8cDugN23T2ElUTIzxbc06lNZBDUvbD/UmUuMZ4RgM3OjXfh
         CGbIYbSdU21BxUWAiDALQUwYtHPDWYzKyySvPZxxOeA8xsi5KF4N/tw5IechhNWAu8UM
         mu3PgkMOlnbWr6PeDDWs4Il25iZvwEfIAHdPVEO6CuV1mELbKOd8cn9X++XbY/mMHW5f
         VoQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795627558; x=1796232358;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0eeo8xLsFVG8280bwD1Dy/maRtfEJTegVNCHlzkxjN0=;
        b=lNCwHUtDun7E0yL8iLpzAfu/fjihCnKyzQw60BNFlh+IoAOjXVVyNpAKMw9i6ORhWy
         i6YJNE6eSeBJgxW8kHFYKfQCJ4QSl0r8ww++YHBdsJ0Wqlfrc5/oDhoBC+ouSuyd4gy9
         LOzFhdL6/mt4VOVnZEXTgjh6JRCx3lTdV/jldG2svQr2VKCuRHWfA8fAzu8IFOvep7Y2
         aCbM7nKmONVkFDQZxRB5xMxQq7uPPQZ7X+JjP5BLtbx9Thtcd69hfZVMeLBrirmPf/NZ
         GMTUfnMY3Tls6iVsq/K0IKm1F6HvKspq8W6TTfwimIJ4ttR8cfSmMWePgdW2YfVKpgd8
         fvig==
X-Gm-Message-State: APuU4Z/H3E1iFS3+MFXX4khuCKX4uXoApLVwjkVHRyLlqRvfETYLZVdB
	giHi8dJJ4Yo8P+mL6cTt05YKoWbwGC8NMa15AmipiuYFv/yz/X6MtfjJHtvn1pkmbos=
X-Gm-Gg: AZFdTZdjO1Rt8MQMcWR2REhR049zDdnGW18rd4eyVStU6ewiyduAxbkjoHTYvysMQHx
	qphuu7dSxeoavgKHbtZHLK44jS45Vl8pQkMRESQcHSpHgEYAjtWpnw7l7v+KMFnOI6GQb99HnwW
	bQZVVSb0Rk4CFbJ8nPQpbCZhynpqSedY37WWX6Fga8v3XtqZBctlz0F/DS7DvLq4C9vBcd1wyXj
	W4lU40Tgp3NuMYpWIkP0AQncaBhSMIzsZBKGwVr2EaSbi9xKk6q/ZhLKNynhBQ8XV0e1cWePoY6
	eb8w6QA1OFa8IHTBWPVxWBDkXW5M4ztq+ufqTU6kfLgwM7eQjRVuTxGItv7poUunLs60s0lo08G
	yOFtT++XOdHvCbyR99SUs0u1TpgWla1Z9QfyTyDhxswGJ2xesWARLUjf1288aiMYGEBRHTDnDsx
	RoRgEt1kkqnPT9F1OdoF84Tx0ROo9MROabOYVUldOS8e0vTOQnVFpFTbH4n6JC5MBfel7e6oFXX
	nhOrY/MR2ir7GOhPl8NFKaO4/FVxnWnZ1mEzZluLDBEaacip+D9TTt7OenYdxmVP+wlO+XLWVQa
	BrMXOl0Y1Au8l/4EnhFZ5bTKstDTHrsIclLKN6NldgBOlfy+k05LgAVU5E+yUDvTHT049BaftIs
	WUUQKFl7YU7iaNegxpFksECQch2TRwK9sACfz+uS9sYgc5cc=
X-Received: by 2002:a05:6830:2e13:b0:822:95ff:43f3 with SMTP id 46e09a7af769-863157b02famr24543779a34.24.1795627557598;
        Wed, 25 Nov 2026 09:25:57 -0800 (PST)
Received: from [192.168.0.102] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8631682200esm13061193a34.2.2026.11.25.09.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 09:25:56 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Louis Thiery <thiery.louis@gmail.com>
Cc: io-uring@vger.kernel.org, Pavel Begunkov <asml.silence@gmail.com>, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20261119232935.1708458-1-thiery.louis@gmail.com>
References: <20261119232935.1708458-1-thiery.louis@gmail.com>
Subject: Re: [PATCH] io_uring/net: don't charge the folio offset to
 truesize for managed frags
Message-Id: <179562755579.12696.13061594470426753053.b4-ty@b4>
Date: Wed, 25 Nov 2026 10:25:55 -0700
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Thu, 19 Nov 2026 23:29:35 +0000, Louis Thiery wrote:
> Registered buffers backed by huge pages are coalesced into one bvec per
> folio, so bv_offset is relative to the folio, not to a 4K page.
> io_sg_from_iter() adds PAGE_ALIGN(bv_len + bv_offset) to the skb
> truesize, which charges the socket for the whole run-up inside the
> folio. A 64K send from 1.5MB into a 2MB THP folio adds about 1.6MB of
> truesize, and sk_wmem_queued fills long before any real memory is used.
> 
> [...]

Applied, thanks!

[1/1] io_uring/net: don't charge the folio offset to truesize for managed frags
      commit: aaa55c8ff9147b1ce1ba50267aa9f080d469a963

Best regards,
-- 
Jens Axboe



