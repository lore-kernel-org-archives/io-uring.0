Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795027156;
	b=IS38p+yn+x7IE9S//XS5wDzyAvMPIERq/qqiZRoLaKCRXFNlhlzg0ghZH338V6RxTph3
	 zo0PywfHIcAG9ceY6+mMyfU7OzVYzKRmCO6j0IEeOl12G8vEXXpnYB88iEv6cd2/d8V75
	 ccvu72X/twaUX51dCYZbiAAiW8C4epjYANlTW8zzBhCeWD1brGjmtMcI5bcFHQY5v8aON
	 wUA0SwBIZP/gH3MmikbARTSyg2yjWpUMBaNSGtlxZNnnD7T/OPyyw+dXl0LVlYP4k6D1X
	 ojLxAIcIQ8QGKplIv69PbkxgZnNoQ7dHXt7r9ex/XJ8isZO1zmWtzyur2/1BYd539hg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795027156;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rOk5XMLKV41q7GLzoLXIV7TkndqjJrVZPK5114ekmS8=;
	b=xUgZcpvj54bpiMEoojLijB/NeCyQ8P4b9KqCVO65M+hKi7s86wCsFIgHAfayMnQtxXMO
	 jSqNFZcWkaLRxZz9/EVqATDuzQTG/Dd39LUkIAtf5+1PUz+NERmO+R4YYS1di+UpnPywO
	 3yaetAZYxxo7u6wKSeKZ1Lr6cbySZabWjFOtK1p7TjafnygTavFrci2LR/ZexkkzhgKlk
	 Vewjypy6zcusBNycBU0DP8IFc+m7tXCrRobbvxgiX68OTlZKZ8Kg2fhWkKODL5EN5ZhuY
	 ZdIpAZI9d1rD7fm004oyYFJ5HstaLC/nF3oxhPsKnrFdg0Q421+pvkJPWVSYB4QCa8Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZAaEvO25;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779EF606A32C
	for <io-uring@vger.kernel.org>; Wed, 18 Nov 2026 18:39:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 779EF606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZAaEvO25
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1ae7fc5681dso523c88.1
        for <io-uring@vger.kernel.org>; Wed, 18 Nov 2026 10:39:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795027155; cv=none;
        d=google.com; s=arc-20260327;
        b=EC/1Van5tdKizWtW7DYcW2yOComIAp0i5ClBTRwtatrTSI/Cu63B1em6aRhPy3sdC8
         MnxTqbVHiyqL2qdhScDadame8InvtnCIL9rgmh2UWB3Mnp7vDexvqg5S4+A/AVPUzPxH
         bw0UHAGvsWUgTmrbS3wXA16knNU3PLcXoiZseWtS+3BJSlBTllC/a/Y4e+TSleCMxRRI
         K64QxlSuaBZkXGAnNkTbmf6QG+VEBp6tKDbfryd7Is7MrHJ9LY3KreRI/EFTuJG6m/rk
         Xh1ww111KwNq1WXg99f2ccazMls34egvjFqLgszAb1C+5No4YF6gR0VPH29SyqPBvZS/
         Gm/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rOk5XMLKV41q7GLzoLXIV7TkndqjJrVZPK5114ekmS8=;
        fh=7xfTPEADScVfDRJ4IophMH/PBpaiphEmuwPP5w0OdCg=;
        b=c/cwPzqolxFUF0vxX76YjiymwOyF/Enblns+UTc/1TyTlktw6rKdFJC+zYaFhwgdfP
         2iqDTIVVO7tIiaIY8YAkDmN5sgkNz7H8G8mkfNj2BQZ//hHWJ5Ne8CBq2UJ5AAghh/+8
         Mt0Qq36kfOgJvlyrC8h9oho5Ro3t/ilWOe56xKGEYdsZx/uxgeQBE8JDryBT047Cwy5O
         D/xFkOdMdxnYarcvUOiqvKYkhOpUuBHbOhDGujWPCe7RxjDa7WC5GQ/62p5ujbW2z1yZ
         APh3OG2li+2rMp59TkCtK9YV53bAvTK10L8v4v5N+r46Q6czQaZDsaRCl83IMcsCp6GD
         PX6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795027155; x=1795631955; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rOk5XMLKV41q7GLzoLXIV7TkndqjJrVZPK5114ekmS8=;
        b=ZAaEvO25CR3taVZcmnXF68wjTJix97rTrAGQ68xEM0GZSJjDB9dTmNdrvjcsjM5DAx
         MrRb8zbkzIWx50PjRSz6yorIDv8ibAviTnCQVVMSFzRQKVfZDiU6XyQs5w4HPAs5tqzD
         BsgtAY1SsuWj6nr/2cFRjkySkht8K0EsTj4DWsoLRj1zxwUM6IWMeKjUq982hpNC3ZCr
         n50I+m3FYF/WfSGc04kSTIoD5lGEfobfZQ7rtJZe77/acKLaeQOrTfCWkvAi/480aW/m
         P5BBg38eh0luesS4uP/AuaPUW5Iqh2v7QaTFsq7xfoAid8Nn8HgUQTCNX+xUS9WiQBDn
         UYVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795027155; x=1795631955;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rOk5XMLKV41q7GLzoLXIV7TkndqjJrVZPK5114ekmS8=;
        b=Vh6Ls/3OuDdIGWauTweyLSXvfGxzijL8XDUzdqRI3UQLSRZ/fQjHlh2Xi79vgXR6UL
         FrT8Idi9RGzqIHCh90DHB9UVFm8+IDAaWwArklcGcTcoj70qvKoQU/vyWuQAnp/Aoodn
         NVX0OHV8+Z6lW4onQWvrtN8ROhEriEbTONW8a6jr6LTKLWUHasdqv+MHOnf+ZQLo4mDB
         YjP+2jcWO9l+EAv7G0C+VyFppkocRDLfNauIoOUaxlUHzlnYnEt3AhiRaarhr7VHBi1R
         AoQUUwZjCF7a4SfH3wxwcjOe0BJIKub0VWQS9PvpcLFPQNcYYaNKV43889CQbMUU8KFj
         irdg==
X-Forwarded-Encrypted: i=1; AL+hErHc8k25lqaa1+bPEa1Na1UPNfsM7OXa2ZNBOnkBu5PTvVR+Gs3BKc1gi0J73LVB8Kn6hfHbJ1Qbwg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+yt7PUibH4fPOBNV/+mdz0moSbe1d97Hh3Qd5PIScWzMGsTmQM
	2yQtni3HUxjBhT4I+WqBcugQY/GAIMdjexkEeFm5pRT3hBQ7vFveDpBZYzX0X6ESDepB1+AfQHY
	8JhWt//OWUHrbbVp0LtzADrbcdrgb4H22sXSMIDcl
X-Gm-Gg: AYBFou1sCFZSVHTscFCoKrlODvjvgQAXdNc92QV0E3MG0i5ZK9dujnph4o4YbO+5xul
	eOSPgd0HFflRJppivuWuL8hLg8oCTctg/gfI5LUaJmQAhLXqrlQKuUvbjtzCi0DAYdc40WTociL
	vSjRyP2Cbx33qYYz0cOSbQwNguoUdZSsnmrvnz8+7IXdRcHhb/tD0FXuy7FMPj80aqBqSU6unUm
	4rL+dToU4GuHF7W1X6XmLJsAyydq0SUu721Gr6b2JvEU9o0yUy4ekxD3KREoRYiozOLv7r334tX
	GzCRt4Ucf53x4PQ3ZwARXvfV2yowcUIgdL88ag6bBxKdqECRz7Xj9QmrsdOOVnbTdTTMIntLqar
	kzKECijcLbCQrD+ZdGoHR6rK2vuKG9CdEB+3B4Q==
X-Received: by 2002:a05:701b:2903:b0:133:12e0:aab7 with SMTP id
 a92af1059eb24-1b54d350911mr22039c88.11.1795027154537; Wed, 18 Nov 2026
 10:39:14 -0800 (PST)
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110102039.1002605-1-bjorn@kernel.org> <20261110102039.1002605-2-bjorn@kernel.org>
 <20261115131314.2d3ab96f@kernel.org> <87wlqcg85c.fsf@all.your.base.are.belong.to.us>
 <20261117163258.446a0c45@kernel.org>
In-Reply-To: <20261117163258.446a0c45@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Wed, 18 Nov 2026 10:39:00 -0800
X-Gm-Features: AclHuK8UJH3E_Epp2jjC1wv6_uDQD4oZqE2pXj-5wMybSCyzlV0cK1dXGLNdYt8
Message-ID: <CAHS8izNe7w5gcTrVW_gMue0-2HBbRkTpiqtUUcRGHZnPwiLp4g@mail.gmail.com>
Subject: Re: [PATCH net-next v1 01/11] net: Get skb fragment addresses through netmem
To: Jakub Kicinski <kuba@kernel.org>
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Magnus Karlsson <magnus.karlsson@intel.com>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Alexander Duyck <alexanderduyck@fb.com>, kernel-team@meta.com, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, Jens Axboe <axboe@kernel.dk>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, netdev@vger.kernel.org, 
	bpf@vger.kernel.org, io-uring@vger.kernel.org, 
	"Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>, Weiming Shi <bestswngs@gmail.com>, 
	Nikolay Aleksandrov <razor@blackwall.org>, David Wei <dw@davidwei.uk>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Stuart Clark <stuclar@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 4:33=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Mon, 16 Nov 2026 15:31:27 +0100 Bj=C3=B6rn T=C3=B6pel wrote:
> > > IIRC netmem is supposed to be used for frags and memory CPU never nee=
ds
> > > to access.
> >
> > netmem covers pages too, and netmem.rst already allows readable net_iov=
s
> > ("Decouple net_iov from unreadability"); the in-tree ones just happen t=
o
> > be unreadable.
>
> Ugh, slop got in :/ I really don't think "the in-tree ones just happen
> to be unreadable." I seem to recall being involved in that design.

Oh, that was an intentional, I didn't think there was any reason
readable net_iovs couldn't exist in the future. Actually even dmabuf
net_iovs can be made readable sometimes, as some dmabufs support
dma_buf_vmap, and in theory the net_iov could hold a virtual address
derived from the return value of dma_buf_vmap that the kernel can
access.

Do you think there is a reason net_iovs can never be extended to
readable memory?

Do you want that point from netmem.rst reverted?

--=20
Thanks,
Mina
